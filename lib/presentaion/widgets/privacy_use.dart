import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_solutions_application/core/utils/app_router.dart';

class PrivacyUse extends StatelessWidget {
  const PrivacyUse({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kPrivacyScreen);
                },
                child: Text(
                  'سياسة الخصوصية',
                  style: TextStyle(
                      fontSize: 12.sp, color: const Color(0xffA3AED0)),
                )),
            TextButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kTermsUse);
                },
                child: Text(
                  'شروط الاستخدام',
                  style: TextStyle(
                      fontSize: 12.sp, color: const Color(0xffA3AED0)),
                )),
          ],
        ),
        SizedBox(
          height: 6.h,
        ),
      ],
    );
  }
}
