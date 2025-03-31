import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/constants.dart';
import 'package:smart_solutions_application/core/utils/app_router.dart';
import 'package:smart_solutions_application/core/utils/assets.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavBar(
      {Key? key, required this.selectedIndex, required this.onTap})
      : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  Color _buttonColor = kPrimaryColor;

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
              border: Border.all(color: const Color(0xffF1F1F1), width: 1.w),
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xffD7D7D7).withOpacity(30 / 100),
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
                  buildNavBarItem(AppAssets.home, 'الرئيسية', 0),
                  buildNavBarItem(AppAssets.facilities, 'المنشآت', 1),
                  SizedBox(width: 30.w),
                  buildNavBarItem(AppAssets.owners, 'المالكون', 2),
                  buildNavBarItem(AppAssets.warnings, 'الانذارات', 3),
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
                _buttonColor = const Color(0xff004590);
              });
            },
            onTapUp: (_) {
              setState(() {
                _buttonColor = kPrimaryColor;
              });
            },
            onTapCancel: () {
              setState(() {
                _buttonColor = kPrimaryColor;
              });
            },
            onTap: () {
              GoRouter.of(context).push(AppRouter.kSendNotiScreen);
            },
            child: Container(
              width: 66.49.w,
              height: 66.49.h,
              decoration: BoxDecoration(
                color: _buttonColor, // استخدام المتغير الذي يخزن اللون الحالي
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffB0B0B0).withOpacity(33 / 100),
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
                ? Colors.black
                : const Color(0xff000000).withOpacity(30 / 100),
          ),
          SizedBox(height: 6.h),
          Text(
            label,
            style: TextStyle(
              color: widget.selectedIndex == index ? Colors.black : Colors.grey,
              fontSize: 10.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
