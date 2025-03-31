import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/widgets/warning_widget.dart';
import 'package:smart_solutions_application/presentaion/screens/owner_app/screens/empty_screen.dart';

import '../../../core/utils/assets.dart';

class WarningsScreen extends StatefulWidget {
  @override
  State<WarningsScreen> createState() => _WarningsScreenState();
}

class _WarningsScreenState extends State<WarningsScreen> {
  bool isRead = false;
  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: isEmpty
              ? [
            SizedBox(
              height: 204.h,
            ),
            const EmptyScreen(
                image: AppAssets.noWarning,
                title: AppStrings.noNotificationsAvailable),
          ]
              : [
            const WarningWidget(
              date: '23, 2024 at 3:15 PM',
              isRed: true,
              nameFac: AppStrings.sampleFacilityName,
              nameSer: AppStrings.services,
            ),
            const WarningWidget(
              date: '23, 2024 at 3:15 PM',
              isRed: false,
              nameFac: AppStrings.sampleFacilityName,
              nameSer: AppStrings.services,
            ),
          ],
        ),
      ),
    );
  }
}