import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/core/utils/app_router.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';

import '../../../../core/utils/assets.dart';

class BottomEmployeeWidget extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const BottomEmployeeWidget(
      {Key? key, required this.selectedIndex, required this.onTap})
      : super(key: key);

  @override
  State<BottomEmployeeWidget> createState() => _BottomEmployeeWidgetState();
}

class _BottomEmployeeWidgetState extends State<BottomEmployeeWidget> {
  Color _buttonColor = AppColors.kPrimaryColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: 25.h,
            left: 16.w,
            right: 16.w,
          ),
          child: Container(
            height: 69.h,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.searchBoxBackground, width: 1.w),
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: AppColors.lightGrey.withOpacity(30 / 100),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  buildNavBarItem(AppAssets.home, AppStrings.overView, 0),
                  buildNavBarItem(AppAssets.services, AppStrings.services, 1),
                  SizedBox(width: 30.w),
                  buildNavBarItem(AppAssets.warnings, AppStrings.warnings, 2),
                  buildNavBarItem(AppAssets.profile, AppStrings.adminProfile, 3),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 138.w,
          right: 138.w,
          bottom: 50.h,
          child: GestureDetector(
            onTapDown: (_) {
              setState(() {
                _buttonColor = AppColors.kPrimaryColor.withOpacity(0.8);
              });
            },
            onTapUp: (_) {
              setState(() {
                _buttonColor = AppColors.kPrimaryColor;
              });
            },
            onTapCancel: () {
              setState(() {
                _buttonColor = AppColors.kPrimaryColor;
              });
            },
            onTap: () {
              GoRouter.of(context).push(AppRouter.kSendNotiScreen);
            },
            child: Container(
              width: 66.49.w,
              height: 66.49.h,
              decoration: BoxDecoration(
                color: _buttonColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey.withOpacity(33 / 100),
                    blurRadius: 9,
                    offset: const Offset(0, 3),
                    spreadRadius: 6,
                  )
                ],
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 33.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNavBarItem(String icon, String label, int index) {
    return GestureDetector(
      onTap: () => widget.onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            icon,
            color: widget.selectedIndex == index
                ? AppColors.black
                : AppColors.black.withOpacity(30 / 100),
          ),
          SizedBox(height: 6.h),
          Text(
            label,
            style: Styles.ownerNameTextStyle.copyWith(
              color: widget.selectedIndex == index ? AppColors.black : AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}