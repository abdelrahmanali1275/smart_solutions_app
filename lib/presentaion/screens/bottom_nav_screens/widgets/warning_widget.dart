import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_solutions_application/constants.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_button.dart';

import '../../../../core/utils/assets.dart';

class WarningWidget extends StatefulWidget {
  const WarningWidget({
    super.key,
    required this.date,
    required this.isRed,
    required this.nameFac,
    required this.nameSer,
  });

  final bool isRed;
  final String date;
  final String nameFac;
  final String nameSer;

  @override
  State<WarningWidget> createState() => _WarningWidgetState();
}

class _WarningWidgetState extends State<WarningWidget> {
  bool isRead = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Container(
        width: 343.w,
        height: 308.h,
        decoration: Styles.containerBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Styles.buildStatusContainer(widget.isRed),
                  const Spacer(),
                  Styles.buildDateContainer(widget.date),
                ],
              ),
              SizedBox(height: 16.h),
              Text(widget.nameFac, style: Styles.facilityTextStyle),
              SizedBox(height: 8.h),
              Container(
                width: 311.w,
                height: 149.h,
                decoration: Styles.warningBoxDecoration,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Styles.buildServiceIcon(AppAssets.ghaz),
                          SizedBox(width: 4.w),
                          Text(widget.nameSer, style: Styles.serviceTextStyle),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Divider(color: const Color(0xffC4C4C4), thickness: 0.5.w),
                      SizedBox(height: 7.h),
                      SizedBox(
                        width: 280.w,
                        height: 80,
                        child: RichText(
                          text: const TextSpan(
                            children: AppStrings.warningMessages,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              CustomButton(
                onTap: () {
                  setState(() {
                    isRead = true;
                  });
                },
                title: isRead ? AppStrings.readWarning : AppStrings.confirmReadWarning,
                color: isRead ? Styles.readButtonColor : kPrimaryColor,
                textColor: isRead ? Styles.readButtonTextColor : Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}