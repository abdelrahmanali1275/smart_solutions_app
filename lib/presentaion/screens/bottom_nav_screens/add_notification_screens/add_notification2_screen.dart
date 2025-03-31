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
import 'package:smart_solutions_application/presentaion/widgets/simple_app_bar.dart';

class AddNotification2Screen extends StatefulWidget {
  const AddNotification2Screen({super.key});

  @override
  _AddNotification2ScreenState createState() => _AddNotification2ScreenState();
}

class _AddNotification2ScreenState extends State<AddNotification2Screen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  bool isButtonEnabled = false;
  String repeatOption = AppStrings.repeat.tr();
  String replyOption = AppStrings.noReply.tr();
  String type = AppStrings.notificationType.tr();
  String sendTo = AppStrings.sendTo.tr();

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
                    sendTo = AppStrings.admin.tr();
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
                      color: const Color(0xffD7D7D7),
                      width: 0.7.w,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.admin.tr(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sendTo = AppStrings.owner.tr();
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
                    border: Border.all(
                      color: const Color(0xffD7D7D7),
                      width: 0.7.w,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.owner.tr(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: kPrimaryColor,
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
                    color: const Color(0xffF2F2F7),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.cancel.tr(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
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
                    type = AppStrings.urgent.tr();
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
                      color: const Color(0xffD7D7D7),
                      width: 0.7.w,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.urgent.tr(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    type = AppStrings.important.tr();
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  width: 343.w,
                  height: 57.5.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xffD7D7D7),
                      width: 0.7.w,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.important.tr(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    type = AppStrings.normal.tr();
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  width: 343.w,
                  height: 57.5.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xffD7D7D7),
                      width: 0.7.w,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.normal.tr(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: kPrimaryColor,
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
                    color: const Color(0xffF2F2F7),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.cancel.tr(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
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
              SizedBox(
                height: 15.h,
                width: double.infinity,
              ),
              Text(
                AppStrings.additionalNotificationDetails.tr(),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: kTextColorLight,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          repeatOption = AppStrings.repeat.tr();
                        });
                      },
                      child: Container(
                        width: 171.w,
                        height: 54.h,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xffD9D9D9).withOpacity(0.18),
                              blurRadius: 3,
                              spreadRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                          color: repeatOption == AppStrings.repeat.tr()
                              ? const Color(0xffF4F7FE)
                              : Colors.white,
                          border: Border.all(
                            color: repeatOption == AppStrings.repeat.tr()
                                ? kPrimaryColor
                                : Colors.grey,
                            width: repeatOption == AppStrings.repeat.tr()
                                ? 1.w
                                : 0.2.w,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: Row(
                            children: [
                              Radio(
                                value: AppStrings.repeat.tr(),
                                groupValue: repeatOption,
                                activeColor: kPrimaryColor,
                                onChanged: (value) {
                                  setState(() {
                                    repeatOption = value.toString();
                                  });
                                },
                              ),
                              Text(
                                AppStrings.repeat.tr(),
                                style: TextStyle(
                                  color: const Color(0xff717171),
                                  fontSize: 10.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          repeatOption = AppStrings.noRepeat.tr();
                        });
                      },
                      child: Container(
                        width: 171.w,
                        height: 54.h,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xffD9D9D9).withOpacity(0.18),
                              blurRadius: 3,
                              spreadRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                          color: repeatOption == AppStrings.noRepeat.tr()
                              ? const Color(0xffF4F7FE)
                              : Colors.white,
                          border: Border.all(
                            color: repeatOption == AppStrings.noRepeat.tr()
                                ? kPrimaryColor
                                : Colors.grey,
                            width: repeatOption == AppStrings.noRepeat.tr()
                                ? 1.w
                                : 0.2.w,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: Row(
                            children: [
                              Radio(
                                value: AppStrings.noRepeat.tr(),
                                groupValue: repeatOption,
                                activeColor: kPrimaryColor,
                                onChanged: (value) {
                                  setState(() {
                                    repeatOption = value.toString();
                                  });
                                },
                              ),
                              Text(
                                AppStrings.noRepeat.tr(),
                                style: TextStyle(
                                  color: const Color(0xff717171),
                                  fontSize: 10.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                AppStrings.replyOption.tr(),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: kTextColorLight,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          replyOption = AppStrings.allowReply.tr();
                        });
                      },
                      child: Container(
                        width: 171.w,
                        height: 54.h,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xffD9D9D9).withOpacity(0.18),
                              blurRadius: 3,
                              spreadRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                          color: replyOption == AppStrings.allowReply.tr()
                              ? const Color(0xffF4F7FE)
                              : Colors.white,
                          border: Border.all(
                            color: replyOption == AppStrings.allowReply.tr()
                                ? kPrimaryColor
                                : Colors.grey,
                            width: replyOption == AppStrings.allowReply.tr()
                                ? 1.w
                                : 0.2.w,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: Row(
                            children: [
                              Radio(
                                value: AppStrings.allowReply.tr(),
                                groupValue: replyOption,
                                activeColor: kPrimaryColor,
                                onChanged: (value) {
                                  setState(() {
                                    replyOption = value.toString();
                                  });
                                },
                              ),
                              Text(
                                AppStrings.allowReply.tr(),
                                style: TextStyle(
                                  color: const Color(0xff717171),
                                  fontSize: 10.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          replyOption = AppStrings.noReply.tr();
                        });
                      },
                      child: Container(
                        height: 54.h,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xffD9D9D9).withOpacity(0.18),
                              blurRadius: 3,
                              spreadRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                          color: replyOption == AppStrings.noReply.tr()
                              ? const Color(0xffF4F7FE)
                              : Colors.white,
                          border: Border.all(
                            color: replyOption == AppStrings.noReply.tr()
                                ? kPrimaryColor
                                : Colors.grey,
                            width: replyOption == AppStrings.noReply.tr()
                                ? 1.w
                                : 0.2.w,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: Row(
                            children: [
                              Radio(
                                value: AppStrings.noReply.tr(),
                                groupValue: replyOption,
                                activeColor: kPrimaryColor,
                                onChanged: (value) {
                                  setState(() {
                                    replyOption = value.toString();
                                  });
                                },
                              ),
                              Text(
                                AppStrings.noReply.tr(),
                                style: TextStyle(
                                  color: const Color(0xff717171),
                                  fontSize: 10.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
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
                    border: Border.all(
                      color: const Color(0xffD9D9D9),
                      width: 0.5.w,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 14.h,
                      horizontal: 16.w,
                    ),
                    child: Row(
                      children: [
                        Text(
                          sendTo,
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
              GestureDetector(
                onTap: () {
                  _showSelection(context);
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
                    padding: EdgeInsets.symmetric(
                      vertical: 14.h,
                      horizontal: 16.w,
                    ),
                    child: Row(
                      children: [
                        Text(
                          type,
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
              SizedBox(height: 30.h),
              CustomButton(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kSendNotiScreen3);
                },
                title: AppStrings.continueButton.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}