import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_solutions_application/constants.dart';
import 'package:smart_solutions_application/core/utils/app_router.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/core/utils/assets.dart';



class NotificationItem extends StatelessWidget {
  final String message;
  final String createdAt;
  final bool isNew;
  final bool hasReply;
  final VoidCallback onTap;

  const NotificationItem({
    super.key,
    required this.message,
    required this.createdAt,
    required this.isNew,
    required this.hasReply,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.h), // Fixed typo
        child: Row(
          children: [
            if (isNew)
              Container(
                width: 6.w,
                height: 6.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffEE5D50),
                ),
              ),
            if (isNew) SizedBox(width: 8.w),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: isNew ? const Color(0xffF4F5F7) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border:
                  Border.all(color: const Color(0xffC4C4C4), width: 0.3.w),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25.r,
                    backgroundImage: AssetImage(AppAssets.defaultAvatar),
                  ),
                  title: Text(
                    message,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff333333),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        createdAt,
                        style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                      ),
                      const Spacer(),
                      if (hasReply)
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push(AppRouter.kSendReplay);
                          },
                          child: Text(
                            AppStrings.sendReply.tr(),
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}