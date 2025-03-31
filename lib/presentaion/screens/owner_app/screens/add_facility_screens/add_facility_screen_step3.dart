import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/widgets/show-alert.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_button.dart';
import 'package:smart_solutions_application/presentaion/widgets/simple_app_bar.dart';

import '../../../../../core/utils/assets.dart';

class AddFacilityScreenStep3 extends StatefulWidget {
  const AddFacilityScreenStep3({super.key});

  @override
  _AddFacilityScreenStep3State createState() => _AddFacilityScreenStep3State();
}

class _AddFacilityScreenStep3State extends State<AddFacilityScreenStep3> {
  String facility = AppStrings.selectFacility;
  TextEditingController typAcController = TextEditingController();
  TextEditingController nameOwnerController = TextEditingController();
  TextEditingController workFieldController = TextEditingController();
  String facilities = AppStrings.selectPlan;

  @override
  void initState() {
    super.initState();
  }

  void _showPeriodSelection(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white.withOpacity(0),
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: 343.w,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    facilities = AppStrings.diamondPlan;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  width: 343.w,
                  height: 57.5.h,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    color: Colors.white,
                    border: Border.all(color: AppColors.lightGrey, width: 0.7.w),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.diamondPlan,
                      style: Styles.descriptionTextStyle.copyWith(
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    facilities = AppStrings.goldPlan;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  width: 343.w,
                  height: 57.5.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.lightGrey, width: 0.7.w),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.goldPlan,
                      style: Styles.descriptionTextStyle.copyWith(
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    facilities = AppStrings.silverPlan;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  width: 343.w,
                  height: 57.5.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.lightGrey, width: 0.7.w),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.silverPlan,
                      style: Styles.descriptionTextStyle.copyWith(
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    facilities = AppStrings.bronzePlan;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  width: 343.w,
                  height: 57.5.h,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: Colors.white,
                    border: Border.all(color: AppColors.lightGrey, width: 0.7.w),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.bronzePlan,
                      style: Styles.descriptionTextStyle.copyWith(
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7.5.h),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 343.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: AppColors.lightBlueGrey,
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.cancel,
                      style: Styles.descriptionTextStyle.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    typAcController.dispose();
    nameOwnerController.dispose();
    workFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: AppStrings.backToPreviousStep),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h, width: double.infinity),
            Text(
              AppStrings.selectedServicesDetails,
              style: Styles.descriptionTextStyle.copyWith(
                color: AppColors.kTextColorLight,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              AppStrings.pumpService,
              style: Styles.ownerWidgetNameTextStyle.copyWith(
                color: AppColors.kPrimaryColor,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Container(
                  width: 167.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.lightBlueGrey,
                    border: Border.all(color: AppColors.borderGrey, width: 1.w),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppAssets.alarm),
                      SizedBox(width: 4.w),
                      Text(
                        AppStrings.installationDurationLabel,
                        style: Styles.ownerNameTextStyle.copyWith(
                          fontSize: 10.sp,
                        ),
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        AppStrings.sampleDuration,
                        style: Styles.ownerNameTextStyle.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 9.w),
                Container(
                  width: 167.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.lightBlueGrey,
                    border: Border.all(color: AppColors.borderGrey, width: 1.w),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppAssets.price),
                      SizedBox(width: 4.w),
                      Text(
                        AppStrings.priceLabel,
                        style: Styles.ownerNameTextStyle.copyWith(
                          fontSize: 10.sp,
                        ),
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        AppStrings.samplePrice,
                        style: Styles.ownerNameTextStyle.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              AppStrings.selectPlanPrompt,
              style: Styles.ownerNameTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: () {
                _showPeriodSelection(context);
              },
              child: Container(
                width: 343.w,
                height: 46.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.borderGrey, width: 0.5.w),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
                  child: Row(
                    children: [
                      Text(
                        facilities,
                        style: Styles.ownerWidgetNameTextStyle.copyWith(
                          color: AppColors.searchHintText,
                        ),
                      ),
                      Spacer(),
                      SvgPicture.asset(AppAssets.down),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              AppStrings.gasService,
              style: Styles.ownerWidgetNameTextStyle.copyWith(
                color: AppColors.kPrimaryColor,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Container(
                  width: 167.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.lightBlueGrey,
                    border: Border.all(color: AppColors.borderGrey, width: 1.w),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppAssets.alarm),
                      SizedBox(width: 4.w),
                      Text(
                        AppStrings.installationDurationLabel,
                        style: Styles.ownerNameTextStyle.copyWith(
                          fontSize: 10.sp,
                        ),
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        AppStrings.sampleDuration,
                        style: Styles.ownerNameTextStyle.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 9.w),
                Container(
                  width: 167.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.lightBlueGrey,
                    border: Border.all(color: AppColors.borderGrey, width: 1.w),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppAssets.price),
                      SizedBox(width: 4.w),
                      Text(
                        AppStrings.priceLabel,
                        style: Styles.ownerNameTextStyle.copyWith(
                          fontSize: 10.sp,
                        ),
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        AppStrings.samplePrice,
                        style: Styles.ownerNameTextStyle.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              AppStrings.selectPlanPrompt,
              style: Styles.ownerNameTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: () {
                _showPeriodSelection(context);
              },
              child: Container(
                width: 343.w,
                height: 46.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.borderGrey, width: 0.5.w),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
                  child: Row(
                    children: [
                      Text(
                        facilities,
                        style: Styles.ownerWidgetNameTextStyle.copyWith(
                          color: AppColors.searchHintText,
                        ),
                      ),
                      Spacer(),
                      SvgPicture.asset(AppAssets.down),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            CustomButton(
              onTap: () {
                showAlertDialog(
                  context,
                  AppStrings.confirmAddFacility,
                  AppStrings.confirmAddFacilityMessage,
                );
              },
              title: AppStrings.create,
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}