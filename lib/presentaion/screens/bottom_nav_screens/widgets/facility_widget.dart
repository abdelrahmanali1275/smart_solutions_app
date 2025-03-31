import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/facility_screen.dart';

import '../../../../core/utils/styles.dart';

class FacilityWidget extends StatelessWidget {
  const FacilityWidget({
    super.key,
    required this.nameF,
    required this.nameOwner,
    required this.desName,
    required this.city,
    required this.services,
  });

  final String nameF;
  final String nameOwner;
  final String desName;
  final String city;
  final List<Map<String, dynamic>> services;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.h), // Fixed 'custom' typo
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FacilityScreen(
                facilityName: nameF,
                ownerName: nameOwner,
                city: city,
                services: services,
              ),
            ),
          );
        },
        child: Container(
          width: 343.w,
          height: 339.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.white,
            border: Border.all(
              width: 0.5.w,
              color: AppColors.borderGrey,
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(1.w, 4.h),
                blurRadius: 8.r,
                spreadRadius: 3.r,
                color: AppColors.whiteShadow.withOpacity(0.18),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nameF,
                          style: Styles.facilityNameTextStyle,
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              size: 12.sp,
                              color: AppColors.lightGrey,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              city,
                              style: Styles.cityTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nameOwner,
                          style: Styles.facilityOwnerNameTextStyle,
                        ),
                        Text(
                          desName,
                          style: Styles.facilityDescriptionTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}