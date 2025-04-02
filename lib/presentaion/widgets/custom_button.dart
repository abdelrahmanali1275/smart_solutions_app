import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/constants.dart';
import 'package:smart_solutions_application/core/utils/app_constants.dart';


class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.isdisable = true,
      this.color = kPrimaryColor,
      this.textColor = Colors.white,
      this.borderColor,
      this.widget});


      this.textColor = Colors.white});
  final String title;
  final VoidCallback onTap;
  final isdisable;
  final Color color;
  final Color? borderColor;
  final textColor;
  final Widget? widget;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 343.w,
        height: 44.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor ?? kPrimaryColor),
            color: isdisable ? color : kPrimaryColor.withOpacity(50 / 100)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget ?? const SizedBox(),
            SizedBox(
              width: AppConstants.width5(context),
            ),
            Text(
              title,
              style: TextStyle(color: textColor, fontSize: 12.sp),
            ),
          ],

            color: isdisable ? color : kPrimaryColor.withOpacity(50 / 100)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: textColor, fontSize: 12.sp),
          ),
        ),
      ),
    );
  }
}
