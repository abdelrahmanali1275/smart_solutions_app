import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_button.dart';

import '../../../../core/utils/assets.dart';

void showAlertDialog(
    BuildContext context,
    String title,
    String body,
    ) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Padding(
          padding: EdgeInsets.only(top: 32.h, bottom: 32.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppAssets.sendReplay),
              SizedBox(height: 8.h),
              Text(
                title,
                style: Styles.titleTextStyle.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.darkGrey,
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: 209.w,
                child: Text(
                  body,
                  textAlign: TextAlign.center,
                  style: Styles.descriptionTextStyle.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.kTextColorLight,
                    height: 20 / 14,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              CustomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                title: AppStrings.continueButton,
              ),
            ],
          ),
        ),
      );
    },
  );
}