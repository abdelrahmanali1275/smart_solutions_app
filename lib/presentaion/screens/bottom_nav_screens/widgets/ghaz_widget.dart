import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';

import '../../../../core/utils/styles.dart';

class GhazWidget extends StatelessWidget {
  const GhazWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.val,
  });

  final String title;
  final String icon;
  final String val;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 46.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.dividerLine, width: 0.5.w),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 19.w, left: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 19.w,
              height: 19.h,
              color: AppColors.kPrimaryColor,
            ),
            SizedBox(width: 2.w),
            Text(
              title,
              style: Styles.ghazTitleTextStyle,
            ),
            const Spacer(),
            Text(
              val,
              style: Styles.ghazValueTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}