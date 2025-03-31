import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';

import '../../../../core/utils/assets.dart';

Widget loginHeader() {
  return Column(
    children: [
      SizedBox(
        height: 36.h,
        width: double.infinity,
      ),
      SvgPicture.asset(AppAssets.logoSvg),
      SizedBox(
        height: 13.h,
      ),
      Text(AppStrings.login, style: Styles.titleTextStyle),
      SizedBox(
        height: 24.h,
      ),
      Text(
        AppStrings.companyName,
        style: Styles.ownerWidgetNameTextStyle.copyWith(
          color: AppColors.lightGrey,
        ),
      ),
      SizedBox(
        height: 62.h,
      ),
    ],
  );
}