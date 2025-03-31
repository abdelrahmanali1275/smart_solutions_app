import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/widgets/show-alert.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_button.dart';
import 'package:smart_solutions_application/presentaion/widgets/simple_app_bar.dart';

class SendReplayScreen extends StatefulWidget {
  const SendReplayScreen({super.key});

  @override
  _SendReplayScreenState createState() => _SendReplayScreenState();
}

class _SendReplayScreenState extends State<SendReplayScreen> {
  TextEditingController textEditingController = TextEditingController();
  bool isButtonDisabled = false;

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      setState(() {
        isButtonDisabled = textEditingController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: AppStrings.sendReply.tr()),
      body: Padding(
        padding: EdgeInsets.only(top: 17.h, right: 16.w, left: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.enterReplyHere.tr(),
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff50555C),
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              width: 343.w,
              height: 196.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xffD9D9D9), width: 0.5.w),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 14.h, right: 16.w),
                child: TextField(
                  controller: textEditingController,
                  maxLines: 12,
                  decoration: InputDecoration(
                    hintText: AppStrings.replyHint.tr(),
                    hintStyle: TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xffBDBDBD),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            CustomButton(
              onTap: isButtonDisabled
                  ? () {
                showAlertDialog(
                  context,
                  AppStrings.replySentSuccessTitle.tr(),
                  AppStrings.replySentSuccessMessage.tr(),
                );
              }
                  : () {},
              title: AppStrings.sendReply.tr(),
              isdisable: isButtonDisabled,
            ),
          ],
        ),
      ),
    );
  }
}