import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../home_100/widgets/legand_dot.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'تغير الحرارة والرطوبة في النظام',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              DropdownButton<String>(
                value: 'شهري',
                items: <String>['يومي', 'شهري', 'سنوي']
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
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: true),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const style = TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        );
                        switch (value.toInt()) {
                          case 0:
                            return const Text('JAN', style: style);
                          case 1:
                            return const Text('FEB', style: style);
                          case 2:
                            return const Text('MAR', style: style);
                          case 3:
                            return const Text('APR', style: style);
                          case 4:
                            return const Text('MAY', style: style);
                          case 5:
                            return const Text('JUN', style: style);
                        }
                        return const Text('');
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 3),
                      FlSpot(1, 1),
                      FlSpot(2, 4),
                      FlSpot(3, 2),
                      FlSpot(4, 5),
                      FlSpot(5, 3),
                    ],
                    isCurved: true,
                    color: Colors.blue,
                    dotData: const FlDotData(show: true),
                    belowBarData: BarAreaData(show: false),
                  ),
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 2),
                      FlSpot(1, 4),
                      FlSpot(2, 1),
                      FlSpot(3, 3),
                      FlSpot(4, 2),
                      FlSpot(5, 4),
                    ],
                    isCurved: true,
                    color: Colors.pink,
                    dotData: const FlDotData(show: true),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LegendDot(color: Colors.pink, title: 'درجة الحرارة '),
              SizedBox(width: 16),
              LegendDot(color: Colors.blue, title: 'الرطوبة'),
            ],
          ),
        ],
      ),
    );
  }
}
