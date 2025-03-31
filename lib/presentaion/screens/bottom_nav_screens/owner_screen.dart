import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/widgets/profile_widget.dart';
import 'package:smart_solutions_application/presentaion/widgets/simple_app_bar.dart';

import '../../../core/utils/assets.dart';

class OwnerScreen extends StatelessWidget {
  final String? name;
  final String? avatar;
  final String? location;
  final int? facilities;
  final int? employees;
  final String? phone;
  final String? email;
  final String? address;
  final String? status;

  const OwnerScreen({
    super.key,
    this.name,
    this.avatar,
    this.location,
    this.facilities,
    this.employees,
    this.phone,
    this.email,
    this.address,
    this.status,
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
                height: 194.h,
                child: Image.asset(
                  AppAssets.profileImage,
                  fit: BoxFit.fill,
                ),
              ),
              SimpleAppBar(
                title: '',
                titleColorl: Colors.white,
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
                          spreadRadius: 0),
                    ],
                  ),
                  child: avatar != null && avatar!.isNotEmpty
                      ? Image.network(
                    avatar!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  )
                      : Icon(Icons.person, size: 40.sp),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          Text(
            name ?? AppStrings.ownerNamePlaceholder,
            style: Styles.facilityNameTextStyle,
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_rounded,
                color: AppColors.borderGrey,
                size: 15.sp,
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                location ?? AppStrings.notAvailable,
                style: Styles.ownerWidgetNameTextStyle.copyWith(
                  color: AppColors.borderGrey,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildInfoCard(
                  context: context,
                  icon: AppAssets.facilitiesNum,
                  label: '${facilities ?? 0} ${AppStrings.facilities}'),
              SizedBox(
                width: 8.w,
              ),
              _buildInfoCard(
                  context: context,
                  icon: AppAssets.pepole,
                  label: '${employees ?? 0} ${AppStrings.admin}'),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          ProfileWidget(icon: AppAssets.tel, text: phone ?? AppStrings.notAvailable),
          ProfileWidget(icon: AppAssets.message, text: email ?? AppStrings.notAvailable),
          ProfileWidget(
              icon: AppAssets.location, text: address ?? AppStrings.notAvailable),
          ProfileWidget(
              icon: AppAssets.done,
              text: status ?? AppStrings.notAvailable,
              isActive: status == AppStrings.active),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
      {required BuildContext context,
        required String icon,
        required String label}) {
    return Container(
      width: 167.w,
      height: 104.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: AppColors.dividerLine,
          width: 0.3.w,
        ),
        boxShadow: [
          BoxShadow(
              color: AppColors.dividerLine.withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 4))
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            SizedBox(
              height: 9.h,
            ),
            Text(
              label,
              style: Styles.ownerWidgetNameTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}