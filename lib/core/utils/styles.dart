import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/app_constants.dart';

import '../../constants.dart';

abstract class Styles {
  static final titleTextStyle = TextStyle(
    fontSize: 20.sp,
    color: const Color(0xff565C62),
    fontWeight: FontWeight.w700,
  );

  static final ownerNameTextStyle = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.kTextColorLight,
    letterSpacing: -0.2,
  );
  static TextStyle hintText(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height * .017,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontFamily: "Sora",
  );

  static final descriptionTextStyle = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.kTextColorLight,
    letterSpacing: -0.25,
  );

  static final actionTextStyle = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.kPrimaryColor,
    letterSpacing: -0.25,
  );

  static final serviceNameTextStyle = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.kTextColorLight,
    letterSpacing: -0.2,
  );
  static const textBlue16Bold = TextStyle(
    color: AppColors.kPrimaryColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const textBlack16Bold = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );static const textBlack14Bold = TextStyle(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static final addedServiceTextStyle = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static final labelTextStyle = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.labelTextColor,
    letterSpacing: 0.2,
  );

  static final valueTextStyle = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.labelTextColor,
    letterSpacing: 0.2,
  );

  static final planTextStyle = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.kTextColorLight,
    letterSpacing: 0.2,
  );

  static final facilityNameTextStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static final cityTextStyle = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.lightGrey,
  );

  static final facilityOwnerNameTextStyle = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.kTextColorLight,
  );

  static final facilityDescriptionTextStyle = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.kTextColorLight,
  );

  static final ghazTitleTextStyle = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.kPrimaryColor,
    letterSpacing: -0.2,
  );

  static final ghazValueTextStyle = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
    letterSpacing: -0.2,
  );

  static final homeTitleTextStyle = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.w800,
    color: const Color(0xff333333), // Not in AppColors yet
    height: 1.5,
    letterSpacing: -0.16,
  );

  static final homeNumberTextStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.kPrimaryColor,
  );

  static final homeDescriptionTextStyle = TextStyle(
    fontSize: 7.5.sp,
    fontWeight: FontWeight.normal,
    height: 1.733, // 13 / 7.5
    letterSpacing: -0.15,
  );
  static final ownerWidgetNameTextStyle = TextStyle(color: Colors.red, fontSize: 16.sp);
  static final errorTextStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );



  static TextStyle warningTextStyle(bool isRed) {
    return TextStyle(
      color: isRed ? const Color(0xffF90F0F) : const Color(0xff0A66C2),
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
    );
  }
  static final BoxDecoration containerBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: Colors.white,
    boxShadow: [
      const BoxShadow(
        color: Color(0xffD9D9D9),
        spreadRadius: 0,
        blurRadius: 4,
        offset: Offset(0, 4),
      ),
    ],
    border: Border.all(width: 0.3.w, color: const Color(0xffC4C4C4)),
  );

  static final BoxDecoration warningBoxDecoration = BoxDecoration(
    color: const Color(0xffF4F7FE),
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: const Color(0xffD9D9D9), width: 0.5.w),
  );

  static Widget buildStatusContainer(bool isRed) {
    return Container(
      width: 77.w,
      height: 32.h,
      decoration: BoxDecoration(
        color: isRed ? const Color(0xffF90F0F).withOpacity(0.3) : const Color(0xffF4F7FE),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffD9D9D9), width: 0.3.w),
      ),
      child: Center(
        child: Text(
          isRed ? 'إنذار حرج' : 'إنذار عادي',
          style: TextStyle(
            color: isRed ? const Color(0xffF90F0F) : kPrimaryColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  static Widget buildDateContainer(String date) {
    return Container(
      width: 120.w,
      height: 32.h,
      decoration: BoxDecoration(
        color: const Color(0xffF4F7FE),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffD9D9D9), width: 0.3.w),
      ),
      child: Center(
        child: Text(
          date,
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  static Widget buildServiceIcon(String assetPath) {
    return Container(
      width: 34.w,
      height: 34.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Center(
        child: Image.asset(assetPath, width: 21.w, height: 26.h),
      ),
    );
  }

  static final TextStyle facilityTextStyle = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    color: const Color(0xff333333),
  );

  static final TextStyle serviceTextStyle = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    color: const Color(0xff717171),
  );

  static final Color readButtonColor = const Color(0xff6FCF97).withOpacity(0.3);
  static final Color readButtonTextColor = const Color(0xff43C378);
}