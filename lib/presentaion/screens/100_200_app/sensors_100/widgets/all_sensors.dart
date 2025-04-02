import 'package:flutter/material.dart';
import 'package:smart_solutions_application/core/utils/app_constants.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';
import 'package:smart_solutions_application/presentaion/screens/100_200_app/sensors_100/widgets/search_widget.dart';
import 'package:smart_solutions_application/presentaion/screens/100_200_app/sensors_100/widgets/un_active_sensor.dart';

import 'active_sensor.dart';

class AllSensors extends StatelessWidget {
  const AllSensors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchWidget(),
     SizedBox(
       height: AppConstants.height10(context),
     ),
          const ActiveSensor(),
        SizedBox(
          height: AppConstants.height10(context),
        ),
        const UnActiveSensor()
      ],
    );
  }
}



