import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_solutions_application/core/utils/app_router.dart';
import 'package:smart_solutions_application/presentaion/screens/reset_password_screen/widgets/reset_pass_header.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_button.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_text_field.dart';
import 'package:smart_solutions_application/presentaion/widgets/privacy_use.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.,
            children: [
              resetPassHeader('إعادة تعيين كلمة المرور',
                  'قم بإدخال كلمة المرور الجديدة الخاصة بك', context),
              const CustomTextField(
                title: 'كلمة المرور الجديدة',
                isPassword: true,
                textInputtype: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 8.h,
              ),
              const CustomTextField(
                title: 'تأكيد كلمة المرور الجديدة',
                isPassword: true,
                textInputtype: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomButton(
                  onTap: () {
                    GoRouter.of(context).pushReplacement(AppRouter.kMainScreen);
                  },
                  title: "تحقق و تأكيد"),
              SizedBox(
                height: 328.h,
              ),
              const PrivacyUse()
            ],
          ),
        ),
      ),
    );
  }
}
