import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryWidget extends StatelessWidget {
  final String title;
  final String dateTime;
  final String details;

  const HistoryWidget({
    super.key,
    required this.title,
    required this.dateTime,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        width: 343.w,
        height: 110.h,
        decoration: BoxDecoration(
          color: const Color(0xffF4F7FE),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff333333)),
                  ),
                  const Spacer(),
                  Container(
                    width: 91.w,
                    height: 22.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff007BFF)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        dateTime,
                        style: TextStyle(
                            fontSize: 8.sp, color: const Color(0xff007BFF)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              const Divider(color: Color(0xffC4C4C4)),
              SizedBox(height: 8.h),
              Text(
                details,
                style: TextStyle(
                    fontSize: 10.sp,
                    color: const Color(0xff717171),
                    fontWeight: FontWeight.w500,
                    height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
