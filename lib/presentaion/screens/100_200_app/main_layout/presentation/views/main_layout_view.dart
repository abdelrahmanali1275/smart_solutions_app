import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_solutions_application/presentaion/screens/100_200_app/main_layout/presentation/views/widgets/bottom_nav_bar.dart';

import '../../../home_100/pages/home_screen_100.dart';
import '../../../reports_100/pages/reports_screen_100.dart';
import '../../../sensors_100/pages/sensor_screen_100.dart';
import '../../../settings_100/pages/settings_screen_100.dart';
import '../../../statistics/pages/statistics_screen_100.dart';
import '../view_model/change_nav_bar_status/change_nav_bar_status_cubit.dart';

class MainLayoutView extends StatefulWidget {
  const MainLayoutView({super.key});

  @override
  State<MainLayoutView> createState() => _MainLayoutViewState();
}

class _MainLayoutViewState extends State<MainLayoutView> {
  List<Widget> screens = [
    const HomeScreen100(),
    const SensorScreen100(),
    const ReportsScreen100(),
    const StatisticsScreen(),
    const SettingsScreen(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
  ];

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = ChangeNavBarStatusCubit.get(context);
    return WillPopScope(
      onWillPop: () async {
        // exitDialog(context);
        return true;
      },
      child: BlocBuilder<ChangeNavBarStatusCubit, ChangeNavBarStatusState>(
          builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
          ),
          body: Column(
            children: [
              Expanded(child: screens[cubit.currentIndex]),
              const BottomNavBar(),
            ],
          ),
        );
      }),
    );
    // bottomNavigationBar: const ,
  }
}
