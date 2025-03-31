import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key, required this.icon, required this.name});

  final String icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Container(
        width: 311.w,
        height: 30.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.lightBlueGrey,
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 8.w, left: 16.w, top: 3.h, bottom: 3.h),
          child: Row(
            children: [
              Container(
                width: 22.w,
                height: 22.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                child: Center(
                  child: SvgPicture.asset(icon),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                name,
                style: Styles.serviceNameTextStyle.copyWith(
                  color: AppColors.kTextColorLight,
                ),
              ),
              const Spacer(),
              Container(
                width: 76.w,
                height: 15.h,
                decoration: BoxDecoration(
                  color: AppColors.addedServiceBackground,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    AppStrings.serviceAdded,
                    style: Styles.addedServiceTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}