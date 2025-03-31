import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/owner_screen.dart';

import '../../../../core/utils/styles.dart';

class OwnerWidget extends StatelessWidget {
  const OwnerWidget({
    super.key,
    required this.title,
    this.imageUrl,
    required this.ownerData,
  });

  final String title;
  final String? imageUrl;
  final Map<String, dynamic> ownerData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OwnerScreen(
              name: ownerData['name'],
              avatar: ownerData['avatar'],
              location: ownerData['location'],
              facilities: ownerData['facilities'],
              employees: ownerData['employees'],
              phone: ownerData['phone'],
              email: ownerData['email'],
              address: ownerData['address'],
              status: ownerData['status'],
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: Container(
          width: 327.w,
          height: 59.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(width: 0.3.w, color: AppColors.dividerLine),
          ),
          child: Row(
            children: [
              Container(
                width: 43.w,
                height: 43.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.grey,
                ),
                child: ClipOval(
                  child: imageUrl != null && imageUrl!.isNotEmpty
                      ? Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.person, size: 24.sp),
                  )
                      : Icon(Icons.person, size: 24.sp),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                title,
                style: Styles.ownerWidgetNameTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}