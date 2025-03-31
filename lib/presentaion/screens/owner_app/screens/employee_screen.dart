import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/widgets/profile_widget.dart';
import 'package:smart_solutions_application/presentaion/widgets/simple_app_bar.dart';

import '../../../../core/utils/assets.dart';

class EmployeeScreen extends StatelessWidget {
  final String? name;
  final String? email;
  final String? phone;
  final String? location;
  final String? status;
  final String? imageUrl;

  const EmployeeScreen({
    super.key,
    this.name,
    this.email,
    this.phone,
    this.location,
    this.status,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: 194,
                child: Image.asset(
                  AppAssets.profileBackground,
                  fit: BoxFit.fill,
                ),
              ),
              SimpleAppBar(
                title: '',
                titleColorl: AppColors.white,
                hasAcc: true,
                acction: Container(),
              ),
              Positioned(
                left: 156.h,
                right: 154.w,
                top: 140.h,
                child: Container(
                  width: 65.w,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  height: 65.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.searchHintText,
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: imageUrl != null && imageUrl!.isNotEmpty
                      ? Image.network(
                    imageUrl!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  )
                      : const Icon(
                    Icons.person,
                    size: 40,
                    color: AppColors.grey,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 45.h),
          Text(
            name ?? AppStrings.notAvailable,
            style: Styles.facilityNameTextStyle,
          ),
          SizedBox(height: 3.h),
          SizedBox(height: 24.h),
          ProfileWidget(
            icon: AppAssets.tel,
            text: phone ?? AppStrings.notAvailable,
          ),
          ProfileWidget(
            icon: AppAssets.message,
            text: email ?? AppStrings.notAvailable,
          ),
          ProfileWidget(
            icon: AppAssets.location,
            text: location ?? AppStrings.notAvailable,
          ),
          ProfileWidget(
            icon: AppAssets.done,
            text: status == 'ACTIVE' ? AppStrings.active : AppStrings.inactive,
            isActive: status == 'ACTIVE',
          ),
        ],
      ),
    );
  }
}