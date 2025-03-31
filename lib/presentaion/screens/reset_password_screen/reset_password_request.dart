import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_solutions_application/core/utils/app_router.dart';
import 'package:smart_solutions_application/data/Auth_cubit/auth_cubit.dart';
import 'package:smart_solutions_application/presentaion/screens/reset_password_screen/widgets/reset_pass_header.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_button.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_text_field.dart';
import 'package:smart_solutions_application/presentaion/widgets/privacy_use.dart';

class ResetPasswordRequest extends StatefulWidget {
  const ResetPasswordRequest({super.key});

  @override
  State<ResetPasswordRequest> createState() => _ResetPasswordRequestState();
}

class _ResetPasswordRequestState extends State<ResetPasswordRequest> {
  String? _emailError;
  String? _passwordError;
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            resetPassHeader(
                "إعادة تعيين كلمة المرور",
                "أدخل بريدك الإلكتروني، وإذا كان لديك حساب، سنرسل لك رمزًا لإعادة تعيين كلمة المرور",
                context),
            Center(
              child: CustomTextField(
                title: 'البريد الالكتروني',
                textInputtype: TextInputType.emailAddress,
                controller: _emailController,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess)
                  GoRouter.of(context).pushReplacement(AppRouter.kOtpScreen);
                else if (state is AuthFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('الرجاء ادخال بريد الكتروني فعال'),
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              },
              builder: (context, AuthState) => Center(
                child: CustomButton(
                    onTap: () {
                      _validateFields();
                      if (_emailError == null) {
                        context
                            .read<AuthCubit>()
                            .sendPasswordReset(_emailController.text);
                      }
                    },
                    title: "تسجيل إعادة تعيين كلمة المرور"),
              ),
            ),
            const Spacer(),
            const PrivacyUse(),
          ],
        ),
      ),
    );
  }

  void _validateFields() {
    setState(() {
      _emailError =
          _emailController.text.isEmpty ? 'يرجى إدخال البريد الإلكتروني' : null;
    });
  }
}
