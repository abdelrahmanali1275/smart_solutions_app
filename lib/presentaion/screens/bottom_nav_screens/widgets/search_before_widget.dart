import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';

import '../../../../core/utils/assets.dart';

class SearchBeforeWidget extends StatelessWidget {
  final String title;

  const SearchBeforeWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: Styles.ownerNameTextStyle.copyWith(
                color: AppColors.kTextColorLight,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              AppAssets.search,
              height: 15.h,
              color: AppColors.kTextColorLight,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Container(
          width: 343.w,
          height: 0.5.h,
          color: AppColors.dividerLine,
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}