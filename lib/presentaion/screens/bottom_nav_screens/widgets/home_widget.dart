import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';

import '../../../../core/utils/styles.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.title,
    required this.num,
    required this.des,
    required this.pic,
  });

  final String title;
  final String num;
  final String des;
  final String pic;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105.h,
      width: 163.w,
      decoration: BoxDecoration(
        color: AppColors.lightBlueGrey,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 17.h, bottom: 16.h, right: 10.w, left: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Styles.homeTitleTextStyle,
            ),
            Text(
              num,
              style: Styles.homeNumberTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 118.w,
                  child: Text(
                    des,
                    style: Styles.homeDescriptionTextStyle,
                  ),
                ),
                SizedBox(width: 2.w),
                Container(
                  width: 27.w,
                  height: 27.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: AppColors.labelTextColor,
                  ),
                  child: Center(
                    child: SvgPicture.asset(pic),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}