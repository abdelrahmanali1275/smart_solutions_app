import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_solutions_application/core/utils/assets.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';

Widget resetPassHeader(String title, String subTitle, context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(right: 20.w),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      SizedBox(
        height: 20.h,
      ),
      Center(child: SvgPicture.asset(AppAssets.logoSvg)),
      SizedBox(
        height: 13.h,
      ),
      Center(child: Text(title, style: Styles.titleTextStyle)),
      SizedBox(
        height: 24.h,
      ),
      Center(
        child: SizedBox(
          width: 256.w,
          child: Text(
            textAlign: TextAlign.center,
            subTitle,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff7F868E)),
          ),
        ),
      ),
      SizedBox(
        height: 62.h,
      ),
    ],
  );
}
