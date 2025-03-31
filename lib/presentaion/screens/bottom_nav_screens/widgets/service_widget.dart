import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/widgets/ghaz_widget.dart';

import '../../../../core/utils/assets.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({
    Key? key,
    required this.name,
    required this.title,
    required this.des,
    required this.image,
    required this.installDuration,
    required this.price,
    required this.subscribersCount,
  }) : super(key: key);

  final String name;
  final String title;
  final String des;
  final String image;
  final int installDuration; // مدة التركيب
  final String price; // السعر
  final int subscribersCount; // عدد المشتركين

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 32.h),
      child: Container(
        width: 343.w,
        height: 360.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderGrey, width: 0.5.w),
          boxShadow: [
            BoxShadow(
              color: AppColors.whiteShadow.withOpacity(0.18),
              offset: const Offset(1, 4),
              blurRadius: 8,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: Styles.facilityNameTextStyle.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${AppStrings.subscribersCount}: ${subscribersCount.toString()}',
                    style: Styles.descriptionTextStyle.copyWith(
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              Text(
                AppStrings.firstService,
                style: Styles.cityTextStyle.copyWith(
                  color: AppColors.lightGrey,
                ),
              ),
              SizedBox(height: 5.2.h),
              Container(
                width: 311.w,
                height: 139.h,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.borderGrey, width: 0.5.w),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    AppAssets.ghaz,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                width: 297.w,
                child: Text(
                  title,
                  style: Styles.ghazTitleTextStyle.copyWith(
                    color: AppColors.darkGrey,
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              SizedBox(
                width: 290.w,
                child: Text(
                  des,
                  style: Styles.ghazValueTextStyle.copyWith(
                    color: AppColors.kTextColorLight,
                  ),
                ),
              ),
              SizedBox(height: 16.sp),
              Row(
                children: [
                  GhazWidget(
                    icon: AppAssets.price,
                    title: AppStrings.servicePrice,
                    val: '${price.toString()} ${AppStrings.currencySymbol}',
                  ),
                  SizedBox(width: 8.w),
                  GhazWidget(
                    icon: AppAssets.alarm,
                    title: AppStrings.installationDuration,
                    val: '${installDuration.toString()} ${AppStrings.days}',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}