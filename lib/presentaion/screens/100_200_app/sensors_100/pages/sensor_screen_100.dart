import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/app_constants.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';
import 'package:smart_solutions_application/core/widgets/custom_100_app_bar.dart';
import 'package:smart_solutions_application/presentaion/screens/100_200_app/sensors_100/manager/sensor_100_cubit.dart';
import '../../home_100/widgets/sensor_card.dart';
import '../widgets/active_sensor.dart';
import '../widgets/all_sensors.dart';
import '../widgets/search_widget.dart';
import '../widgets/sensors_tap_item.dart';
import '../widgets/un_active_sensor.dart';

class SensorScreen100 extends StatelessWidget {
  const SensorScreen100({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:  16),
        child: BlocBuilder<Sensor100Cubit, Sensor100State>(
          builder: (context, state) {
            return ListView(
              children: [
                 CustomAppBar100(title: AppStrings.sensorsRemote,
                 widget: InkWell(
                   onTap: () {
                     // showBottomSheet(context: context, builder: (context) => Container(),);
                   },
                   child: const Row(
                     children: [
                       Icon(CupertinoIcons.plus,color: AppColors.kPrimaryColor,),
                       SizedBox(width: 5,),
                       Text('اضافة',
                         style: TextStyle(
                             color: AppColors.kPrimaryColor,
                             fontSize: 16
                         ),),

                     ],
                   ),
                 ),),
                const SizedBox(height: 10,),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: const [
                    SensorCard(
                      title: 'كل المستشعرات',
                      value: '0',
                      backgroundColor: AppColors.blue10,
                    ),
                    SensorCard(
                      title: 'المستشعرات النشطة',
                      value: '0',
                      backgroundColor: AppColors.green10,
                    ),
                    SensorCard(
                      title: 'تنبيه الرطوبة',
                      value: '0',
                      backgroundColor: AppColors.red10,
                    ),
                    SensorCard(
                      title: 'عدد المستشعرات',
                      value: '0',
                      backgroundColor: AppColors.yellow40,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  AppStrings.sensorsRemote,
                  style: Styles.textBlue16Bold,
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.width20(context)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SensorsTapItem(
                              title: AppStrings.all,
                              onTap: () {
                                context.read<Sensor100Cubit>().changeTabs(0);
                              },
                              index: 0,
                            ),
                            SizedBox(
                              width: AppConstants.width5(context),
                            ),
                            SensorsTapItem(
                              title: AppStrings.activee,
                              onTap: () {
                                context.read<Sensor100Cubit>().changeTabs(1);
                              },
                              index: 1,
                            ),
                            SizedBox(
                              width: AppConstants.width5(context),
                            ),
                            SensorsTapItem(
                              title: AppStrings.inactivee,
                              onTap: () {
                                context.read<Sensor100Cubit>().changeTabs(2);
                              },
                              index: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppConstants.height20(context),
                    ),
                    context.read<Sensor100Cubit>().selectedTab == 0
                        ? const AllSensors()
                        : context.read<Sensor100Cubit>().selectedTab == 1
                            ? Column(
                                children: [
                                  const SearchWidget(),
                                  SizedBox(
                                    height: AppConstants.height10(context),
                                  ),
                                  const ActiveSensor(),
                                ],
                              )
                            : Column(
                                children: [
                                  const SearchWidget(),
                                  SizedBox(
                                    height: AppConstants.height10(context),
                                  ),
                                  const UnActiveSensor(),
                                  SizedBox(
                                    height: AppConstants.height10(context),
                                  ),
                                ],
                              )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}