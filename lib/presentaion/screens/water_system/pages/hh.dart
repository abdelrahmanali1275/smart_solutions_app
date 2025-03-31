import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مستخدم جديد'),
        leading: Icon(Icons.person),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // الجزء العلوي: البطاقات الثلاث
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCard(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('تشغيل', style: TextStyle(fontSize: 16)),
                      SizedBox(width: 10),
                      Switch(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
                _buildCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('معدل الإنجاز', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      Text('75%', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            _buildCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('استلام طلبات', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 5),
                  Text('200 طلب', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 20),
            // الجزء السفلي: الرسم البياني
            Expanded(
              child: _buildCard(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('معدل الطلبات', style: TextStyle(fontSize: 16)),
                        DropdownButton<String>(
                          value: 'شهري',
                          items: <String>['شهري', 'أسبوعي', 'يومي']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {},
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: 5,
                          barGroups: [
                            BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 2, color: Colors.blue)]),
                            BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 3, color: Colors.blue)]),
                            BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 4, color: Colors.blue)]),
                            BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 5, color: Colors.blue)]),
                            BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 1, color: Colors.blue)]),
                            BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 3, color: Colors.blue)]),
                          ],
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  const style = TextStyle(fontSize: 12);
                                  switch (value.toInt()) {
                                    case 0:
                                      return Text('يناير', style: style);
                                    case 1:
                                      return Text('فبراير', style: style);
                                    case 2:
                                      return Text('مارس', style: style);
                                    case 3:
                                      return Text('أبريل', style: style);
                                    case 4:
                                      return Text('مايو', style: style);
                                    case 5:
                                      return Text('يونيو', style: style);
                                    default:
                                      return Text('');
                                  }
                                },
                              ),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(show: false),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.water_drop), label: 'التقارير'),
        ],
        currentIndex: 4,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Expanded(
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          height: 100,
          child: child,
        ),
      ),
    );
  }
}