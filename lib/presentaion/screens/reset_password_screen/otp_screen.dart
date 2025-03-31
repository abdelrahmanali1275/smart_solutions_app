import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smart_solutions_application/constants.dart';
import 'package:smart_solutions_application/core/utils/app_router.dart';
import 'package:smart_solutions_application/presentaion/screens/reset_password_screen/widgets/reset_pass_header.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_button.dart';
import 'package:smart_solutions_application/presentaion/widgets/privacy_use.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  String? currentText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            resetPassHeader("إعادة تعيين كلمة المرور",
                'لقد أرسلنا لك رمزًا إلى عنوان بريدك الإلكتروني', context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.w),
              child: PinCodeTextField(
                appContext: context,
                length: 6, // عدد المربعات
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 37.h,
                    fieldWidth: 37.w,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    inactiveColor: Color(0xffD7D7D7),
                    activeColor: kPrimaryColor,
                    borderWidth: 0.5.w,
                    activeBorderWidth: 0.5.w,
                    inactiveBorderWidth: 0.5.w),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                controller: otpController,

                onCompleted: (v) {
                  print("كود التحقق الذي أدخلته هو: $v");
                },
                onChanged: (value) {
                  setState(() {
                    currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  return true; // للسماح بلصق النص
                },
              ),
            ),
            SizedBox(height: 16.h),
            CustomButton(
                onTap: () {
                  GoRouter.of(context).pushReplacement(AppRouter.kNewPassword);
                },
                title: "تحقق و تأكيد"),
            const Spacer(),
            const PrivacyUse(),
          ],
        ),
      ),
    );
  }
}
