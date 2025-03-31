import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/data/models/server_stat_model.dart';
import 'package:smart_solutions_application/presentaion/manager/home_cubit/home_cubit.dart';
import 'package:smart_solutions_application/presentaion/manager/home_cubit/home_state.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/widgets/home_widget.dart';

import '../../../core/utils/assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeFailure) {
          return Center(
            child: Text(
              '${AppStrings.errorPrefix}: ${state.errorMessage}',
              style: Styles.descriptionTextStyle.copyWith(
                fontSize: 16.sp,
                color: Colors.red,
              ),
            ),
          );
        } else if (state is HomeSuccess) {
          final dashboardData = state.dashboardData;
          final serverStats = state.serverStats;

          return Padding(
            padding: EdgeInsets.only(top: 7.h, right: 16.w, left: 16.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.6,
                    shrinkWrap: true,
                    children: [
                      HomeWidget(
                        title: AppStrings.owners,
                        num: '${dashboardData.ownersCount}',
                        des: AppStrings.noDescription,
                        pic: AppAssets.ownersAll,
                      ),
                      HomeWidget(
                        title: AppStrings.owners,
                        num: '${dashboardData.ownersWithSubscriptionsCount}',
                        des: AppStrings.noDescription,
                        pic: AppAssets.ownerServices,
                      ),
                      HomeWidget(
                        title: AppStrings.facilities,
                        num: '${dashboardData.facilitiesCount}',
                        des: AppStrings.noDescription,
                        pic: AppAssets.homeFacilities,
                      ),
                      HomeWidget(
                        title: AppStrings.services,
                        num: '${dashboardData.servicesCount}',
                        des: AppStrings.noDescription,
                        pic: AppAssets.servicesAvailable,
                      ),
                    ],
                  ),
                  SizedBox(height: 41.h),
                  Text(
                    AppStrings.services,
                    style: Styles.titleTextStyle,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    AppStrings.allServicesInSite,
                    style: Styles.descriptionTextStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  _buildBarChart(serverStats),
                ],
              ),
            ),
          );
        } else {
          return Center(child: Text(AppStrings.unknownState));
        }
      },
    );
  }

  Widget _buildBarChart(List<ServerStat> serverStats) {
    return Container(
      padding: EdgeInsets.only(top: 20.h, right: 16.w, left: 10.w),
      height: 309.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.borderGrey, width: 0.5.w),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.whiteShadow.withOpacity(18 / 100),
            offset: Offset(1, 4),
            spreadRadius: 3,
            blurRadius: 8,
          ),
        ],
      ),
      width: 343.w,
      child: BarChart(
        BarChartData(
          barGroups: _generateBarGroups(serverStats),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: AxisTitles(),
            topTitles: AxisTitles(),
            leftTitles: AxisTitles(
              axisNameWidget: Text(AppStrings.services, style: Styles.labelTextStyle),
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  if (value % 10 == 0) {
                    return Text((value.toInt()).toString(), style: Styles.valueTextStyle);
                  }
                  return const SizedBox.shrink();
                },
                reservedSize: 24,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  if (value.toInt() < serverStats.length) {
                    return Text(
                      serverStats[value.toInt()].type,
                      style: Styles.serviceNameTextStyle,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
          gridData: FlGridData(show: true, horizontalInterval: 10),
        ),
      ),
    );
  }

  List<BarChartGroupData> _generateBarGroups(List<ServerStat> serverStats) {
    return List.generate(serverStats.length, (index) {
      final stat = serverStats[index];
      final value = double.tryParse(
          stat.lastRunMessage.replaceAll(RegExp(r'[^0-9.]'), '')) ??
          0;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            fromY: 0,
            toY: value,
            color: AppColors.lightBlueGrey,
            width: 8.w,
            borderRadius: BorderRadius.circular(3),
          ),
        ],
      );
    });
  }
}