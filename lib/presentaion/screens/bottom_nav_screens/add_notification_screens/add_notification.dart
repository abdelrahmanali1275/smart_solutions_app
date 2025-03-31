import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_solutions_application/constants.dart';
import 'package:smart_solutions_application/core/utils/app_router.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/core/utils/assets.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_button.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_text_field.dart';
import 'package:smart_solutions_application/presentaion/widgets/simple_app_bar.dart';

class AddNotificationScreen extends StatefulWidget {
  const AddNotificationScreen({super.key});

  @override
  _AddNotificationScreenState createState() => _AddNotificationScreenState();
}

class _AddNotificationScreenState extends State<AddNotificationScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  bool isButtonEnabled = false;
  String period = AppStrings.am.tr();
  String action = AppStrings.requiredAction.tr();

  @override
  void initState() {
    super.initState();
    titleController.addListener(_checkFields);
    dateController.addListener(_checkFields);
    timeController.addListener(_checkFields);
    detailsController.addListener(_checkFields);
  }

  void _checkFields() {
    setState(() {
      isButtonEnabled = titleController.text.isNotEmpty &&
          dateController.text.isNotEmpty &&
          timeController.text.isNotEmpty &&
          detailsController.text.isNotEmpty;
    });
  }

  void _showPeriodSelection(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white.withOpacity(0),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 187.h,
          width: 343.w,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    period = AppStrings.am.tr();
                  });
                  Navigator.pop(context); // Close the bottom sheet
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
                    border: Border.all(
                        color: const Color(0xffD7D7D7), width: 0.7.w),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.am.tr(),
                      style: TextStyle(fontSize: 16.sp, color: kPrimaryColor),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    period = AppStrings.pm.tr();
                  });
                  Navigator.pop(context); // Close the bottom sheet
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
                    border: Border.all(
                        color: const Color(0xffD7D7D7), width: 0.7.w),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.pm.tr(),
                      style: TextStyle(fontSize: 16.sp, color: kPrimaryColor),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7.5.h),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: Container(
                  width: 343.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color(0xffF2F2F7),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.cancel.tr(),
                      style: TextStyle(fontSize: 16.sp, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSelection(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white.withOpacity(0),
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: 343.w,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    action = AppStrings.review.tr();
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
                    border: Border.all(
                        color: const Color(0xffD7D7D7), width: 0.7.w),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.review.tr(),
                      style: TextStyle(fontSize: 16.sp, color: kPrimaryColor),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    action = AppStrings.audit.tr();
                  });
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: Container(
                  width: 343.w,
                  height: 57.5.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color(0xffD7D7D7), width: 0.7.w),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.audit.tr(),
                      style: TextStyle(fontSize: 16.sp, color: kPrimaryColor),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    action = AppStrings.evaluation.tr();
                  });
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: Container(
                  width: 343.w,
                  height: 57.5.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color(0xffD7D7D7), width: 0.7.w),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.evaluation.tr(),
                      style: TextStyle(fontSize: 16.sp, color: kPrimaryColor),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    action = AppStrings.training.tr();
                  });
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: Container(
                  width: 343.w,
                  height: 57.5.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color(0xffD7D7D7), width: 0.7.w),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.training.tr(),
                      style: TextStyle(fontSize: 16.sp, color: kPrimaryColor),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    action = AppStrings.meeting.tr();
                  });
                  Navigator.pop(context); // Close the bottom sheet
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
                    border: Border.all(
                        color: const Color(0xffD7D7D7), width: 0.7.w),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.meeting.tr(),
                      style: TextStyle(fontSize: 16.sp, color: kPrimaryColor),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7.5.h),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: Container(
                  width: 343.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color(0xffF2F2F7),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.cancel.tr(),
                      style: TextStyle(fontSize: 16.sp, color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    dateController.dispose();
    timeController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: AppStrings.sendNotification.tr()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              Text(
                AppStrings.enterNotificationDetails.tr(),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: kTextColorLight,
                ),
              ),
              SizedBox(height: 19.h),
              CustomTextField(
                title: AppStrings.notificationTitle.tr(),
                textInputtype: TextInputType.text,
                controller: titleController,
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                title: AppStrings.date.tr(),
                textInputtype: TextInputType.datetime,
                controller: dateController,
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  CustomTextField(
                    title: AppStrings.time.tr(),
                    width: 257,
                    textInputtype: TextInputType.number,
                    controller: timeController,
                  ),
                  SizedBox(width: 7.w),
                  GestureDetector(
                    onTap: () {
                      _showPeriodSelection(context); // Show bottom sheet on tap
                    },
                    child: Container(
                      width: 79.w,
                      height: 46.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: const Color(0xffD9D9D9), width: 0.5.w),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppAssets.down),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            period, // Display AM or PM
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xff333333)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Container(
                width: 343.w,
                height: 46.h,
                decoration: BoxDecoration(
                  color: const Color(0xffE5E5EF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xffD9D9D9),
                    width: 0.5.w,
                  ),
                ),
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
                  child: Text(
                    AppStrings.adminNamePlaceholder.tr(),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff333333),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: () {
                  _showSelection(context); // Show bottom sheet on tap
                },
                child: Container(
                  width: 343.w,
                  height: 46.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xffD9D9D9),
                      width: 0.5.w,
                    ),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
                    child: Row(
                      children: [
                        Text(
                          action,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xffBDBDBD),
                          ),
                        ),
                        const Spacer(),
                        SvgPicture.asset(AppAssets.down),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                width: 343.w,
                height: 266.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border:
                  Border.all(color: const Color(0xffD9D9D9), width: 0.5.w),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 14.h, right: 16.w),
                  child: TextField(
                    controller: detailsController,
                    maxLines: 12,
                    decoration: InputDecoration(
                      hintText: AppStrings.notificationDetails.tr(),
                      hintStyle: TextStyle(
                          fontSize: 12.sp, color: const Color(0xffBDBDBD)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 33.h),
              CustomButton(
                onTap: isButtonEnabled
                    ? () {
                  GoRouter.of(context).push(AppRouter.kSendNotiScreen2);
                }
                    : () {}, // Disable button if false
                title: AppStrings.continueButton.tr(),
                isdisable: isButtonEnabled, // Control button appearance
              ),
            ],
          ),
        ),
      ),
    );
  }
}