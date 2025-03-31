import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/custom_100_app_bar.dart';
import '../../100_200_app/home_100/widgets/sensor_card.dart';

class WaterHomeScreen extends StatelessWidget {
  const WaterHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CustomAppBar100(
            title: AppStrings.homeTitle,
            imagePath: AppAssets.profileImage,
          ),
          20.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SensorCard(
                icon: Icon(
                  Icons.home_work_outlined,
                  size: 46,
                  color: AppColors.kPrimaryColor,
                ),
                title: 'المستشعرات النشطة',
                value: '60%',
                backgroundColor: Color.fromRGBO(153, 202, 255, 0.4),
              ).expand(),
              20.width,
              SensorCard(
                icon: Switch(
                  activeColor: AppColors.successGreen,
                  value: true,
                  onChanged: (value) {},
                ),
                title: 'المستشعرات النشطة',
                value: '60%',
                backgroundColor: const Color.fromRGBO(0, 182, 155, 0.1),
              ).expand(),
            ],
          ),
          20.height,
          Row(
            children: [
              const SensorCard(
                title: ' استهلاك الماء',
                value: '200 لتر',
                backgroundColor: Color.fromRGBO(153, 202, 255, 0.4),
              ).expand(),
            ],
          ),
          30.height,
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(249, 249, 250, 0.6),
              borderRadius: BorderRadius.circular(15),

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("معدل الإستهلاك",style: boldTextStyle(),),
                30.height,
                SizedBox(
                  height: 300,
                  child: BarChart(BarChartData(

                    titlesData: FlTitlesData(

                        bottomTitles: AxisTitles(sideTitles: SideTitles(
                          reservedSize: 30,
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
                        )),
                        topTitles: const AxisTitles(axisNameSize: 0),
                        leftTitles: const AxisTitles(axisNameSize: 0),
                        rightTitles: const AxisTitles(axisNameSize: 0)),
                    borderData: FlBorderData(show: false,),
                    gridData: const FlGridData(show: false,),


                    barGroups: [
                    BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(toY: 10, color: AppColors.kBrandColor,
                      ),
                    ],
                  ),
                      BarChartGroupData(x: 2, barRods: [
                        BarChartRodData(
                          toY: 15,
                          color: AppColors.kBrandColor,
                        ),
                      ]),
                      BarChartGroupData(x: 3, barRods: [
                        BarChartRodData(toY: 8, color: AppColors.kBrandColor),
                      ]), BarChartGroupData(x: 4, barRods: [
                        BarChartRodData(toY: 13, color: AppColors.kBrandColor)
                            ]), BarChartGroupData(x: 5, barRods: [
                          BarChartRodData(toY: 20, color: AppColors.kBrandColor),
                        ]),
                      ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
