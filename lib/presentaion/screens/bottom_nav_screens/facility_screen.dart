import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_solutions_application/core/utils/app_router.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/widgets/facility_owner_widget.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/widgets/facility_service_widget.dart';
import 'package:smart_solutions_application/presentaion/widgets/simple_app_bar.dart';

import '../../../core/utils/assets.dart';

class FacilityScreen extends StatelessWidget {
  const FacilityScreen({
    super.key,
    this.facilityName,
    this.ownerName,
    this.city,
    this.services,
    this.isAc = false,
    this.isEmployee = false,
    this.fun,
  });

  final String? facilityName;
  final String? ownerName;
  final String? city;
  final List<Map<String, dynamic>>? services;
  final bool isAc;
  final bool isEmployee;
  final VoidCallback? fun;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: facilityName!,
        acction: isAc == true
            ? Text(
          AppStrings.facilityStaffNotifications,
          style: Styles.actionTextStyle.copyWith(
            fontSize: 12.sp,
            color: AppColors.kPrimaryColor,
          ),
        )
            : Container(
          width: 2,
        ),
        hasAcc: isAc,
        fun: () {
          GoRouter.of(context).push(AppRouter.kEmployeesScreen);
        },
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.h, right: 15.w, left: 17.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: services!.isEmpty
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.start,
            children: [
              if (isEmployee)
                FacilityOwnerWidget(
                  desName: AppStrings.admin,
                  nameOwner: ownerName!,
                  acText: AppStrings.services,
                  fun: fun,
                ),
              if (isEmployee)
                SizedBox(
                  height: 16.h,
                ),
              Container(
                width: 343.w,
                clipBehavior: Clip.antiAlias,
                height: 229.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 0.5, color: AppColors.borderGrey),
                ),
                child: Image.asset(
                  AppAssets.facilityPlaceholder,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              FacilityOwnerWidget(
                nameOwner: ownerName!,
                desName: AppStrings.owner,
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                AppStrings.allServicesInSite,
                style: Styles.labelTextStyle,
              ),
              SizedBox(
                height: 8.h,
              ),
              ...services!.map((service) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: FacilityServiceWidget(
                    icon: service['icon'] ?? AppAssets.ghaz,
                    serviceName: service['name_ar'] ?? AppStrings.noServicesAvailable,
                    installationDuration: service['duration'] ?? AppStrings.notAvailable,
                    price: service['price'] ?? AppStrings.notAvailable,
                    plan: service['plan'] ?? AppStrings.notAvailable,
                    name: '',
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}