import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
    required this.icon,
    required this.text,
    this.isActive = false,
  });

  final String icon;
  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Container(
        width: 343.w,
        height: 59.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.lightBlueGrey,
          border: Border.all(
            width: 0.3.w,
            color: AppColors.dividerLine,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
          child: Row(
            children: [
              Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: isActive ? Colors.white : AppColors.kPrimaryColor,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    icon,
                    colorFilter: isActive
                        ? const ColorFilter.mode(
                        AppColors.kPrimaryColor, BlendMode.srcIn)
                        : null,
                  ),
                ),
              ),
              SizedBox(width: 14.w),
              Text(
                text,
                style: Styles.ownerWidgetNameTextStyle.copyWith(
                  color: AppColors.kTextColorLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}