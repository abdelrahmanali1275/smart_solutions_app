import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/core/utils/assets.dart';
import '../../../../core/utils/styles.dart';

class FacilityOwnerWidget extends StatelessWidget {
  const FacilityOwnerWidget({
    super.key,
    required this.desName,
    required this.nameOwner,
    this.fun,
    this.acText = AppStrings.adminProfile,
  });

  final String nameOwner;
  final String desName;
  final VoidCallback? fun;
  final String acText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 58.h,
      decoration: BoxDecoration(
        color: AppColors.lightBlueGrey,
        boxShadow: [
          BoxShadow(
            color: AppColors.whiteShadow.withOpacity(0.18),
            offset: Offset(0, 2.h),
            spreadRadius: 0,
            blurRadius: 4.r,
          ),
        ],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 4.h, bottom: 4.h, right: 13.w, left: 16.w),
        child: Row(
          children: [
            Container(
              width: 33.w,
              height: 33.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(AppAssets.defaultAvatar),
            ),
            SizedBox(width: 7.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameOwner,
                  style: Styles.ownerNameTextStyle,
                ),
                SizedBox(height: 2.h),
                Text(
                  desName,
                  style: Styles.descriptionTextStyle,
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: fun,
              child: Text(
                acText.tr(),
                style: Styles.actionTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}