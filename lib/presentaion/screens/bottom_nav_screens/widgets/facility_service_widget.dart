import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/core/utils/assets.dart';
import '../../../../core/utils/styles.dart';

class FacilityServiceWidget extends StatelessWidget {
  final String icon;
  final String serviceName;
  final String installationDuration;
  final String price;
  final String plan;

  const FacilityServiceWidget({
    super.key,
    required this.icon,
    required this.serviceName,
    required this.installationDuration,
    required this.price,
    required this.plan,
    required name, // Note: 'name' parameter seems unused; consider removing if not needed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 162.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.borderGrey, width: 0.5.w),
        boxShadow: [
          BoxShadow(
            color: AppColors.whiteShadow.withOpacity(0.18),
            offset: Offset(1.w, 4.h),
            blurRadius: 8.r,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  height: 20.h,
                  width: 21.w,
                ),
                SizedBox(width: 8.w),
                Text(
                  serviceName,
                  style: Styles.serviceNameTextStyle,
                ),
                const Spacer(),
                Container(
                  width: 76.w,
                  height: 23.h,
                  decoration: BoxDecoration(
                    color: AppColors.addedServiceBackground,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.serviceAdded.tr(),
                      style: Styles.addedServiceTextStyle,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Center(
              child: Container(
                width: 311.w,
                height: 0.5.h,
                color: AppColors.dividerLine,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Container(
                  width: 118.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    color: AppColors.lightBlueGrey,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      width: 1.w,
                      color: AppColors.borderGrey,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppAssets.installation),
                      SizedBox(width: 4.w),
                      Text(
                        AppStrings.installationDurationLabel.tr(),
                        style: Styles.labelTextStyle,
                      ),
                      Text(
                        installationDuration,
                        style: Styles.valueTextStyle,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  width: 118.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    color: AppColors.lightBlueGrey,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      width: 1.w,
                      color: AppColors.borderGrey,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppAssets.price),
                      SizedBox(width: 4.w),
                      Text(
                        AppStrings.priceLabel.tr(),
                        style: Styles.labelTextStyle,
                      ),
                      Text(
                        price,
                        style: Styles.valueTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Text(
                  AppStrings.planLabel.tr(),
                  style: Styles.planTextStyle,
                ),
                SizedBox(width: 7.w),
                Text(
                  plan,
                  style: Styles.planTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}