import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_solutions_application/core/utils/app_router.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_button.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_text_field.dart';
import 'package:smart_solutions_application/presentaion/widgets/simple_app_bar.dart';

import '../../../../../core/utils/assets.dart';

class AddFacilityScreenStep2 extends StatefulWidget {
  const AddFacilityScreenStep2({super.key});

  @override
  _AddFacilityScreenStep2State createState() => _AddFacilityScreenStep2State();
}

class _AddFacilityScreenStep2State extends State<AddFacilityScreenStep2> {
  String facility = AppStrings.selectFacility;
  TextEditingController typAcController = TextEditingController();
  TextEditingController nameOwnerController = TextEditingController();
  TextEditingController workFieldController = TextEditingController();
  String facilities = AppStrings.requiredServices;

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
          height: 250.h,
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
                    facilities = AppStrings.pumpService;
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
                      AppStrings.pumpService,
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
                    facilities = AppStrings.gasService;
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
                      AppStrings.gasService,
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
                    facilities = AppStrings.smartAccessService;
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
                      AppStrings.smartAccessService,
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
              SizedBox(height: 10.h)
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 14.h, width: double.infinity),
              CustomTextField(
                title: AppStrings.activityType,
                textInputtype: TextInputType.text,
                controller: typAcController,
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                title: AppStrings.responsibleName,
                textInputtype: TextInputType.text,
                controller: nameOwnerController,
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                title: AppStrings.workField,
                textInputtype: TextInputType.text,
                controller: workFieldController,
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
                        const Spacer(),
                        SvgPicture.asset(AppAssets.down),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Text(
                AppStrings.addFacilityImage,
                style: Styles.descriptionTextStyle.copyWith(
                  color: AppColors.kTextColorLight,
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                width: 343.w,
                height: 124.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.lightGreen,
                  border: Border.all(color: AppColors.borderGrey, width: 0.5.w),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.uploadImageHint,
                      textAlign: TextAlign.center,
                      style: Styles.ownerWidgetNameTextStyle.copyWith(
                        color: AppColors.lightGrey,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    SvgPicture.asset(
                      AppAssets.addPhoto,
                      color: AppColors.lightGrey,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 200.h),
              CustomButton(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kAddFacilityScreen3);
                },
                title: AppStrings.continueButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}