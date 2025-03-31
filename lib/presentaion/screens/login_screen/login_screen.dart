import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_solutions_application/core/utils/app_router.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/presentaion/screens/login_screen/widgets/login_header.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_button.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_text_field.dart';
import 'package:smart_solutions_application/presentaion/widgets/privacy_use.dart';
import 'package:smart_solutions_application/data/Auth_cubit/auth_cubit.dart';

import '../100_200_app/main_layout/presentation/views/main_layout_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _emailError;
  String? _passwordError;

  @override
  void initState() {
    super.initState();
    _checkRememberMe();
  }

  _checkRememberMe() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('token')) {
      GoRouter.of(context).push(AppRouter.kMainOwnerScreen);
    } else {
      if (prefs.containsKey('email')) {
        _emailController.text = prefs.getString('email') ?? '';
      }
      if (prefs.containsKey('password')) {
        _passwordController.text = prefs.getString('password') ?? '';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                loginHeader(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        controller: _emailController,
                        title: AppStrings.email,
                        textInputtype: TextInputType.emailAddress,
                      ),
                      if (_emailError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            _emailError!,
                            style: Styles.ownerWidgetNameTextStyle.copyWith(
                              color: AppColors.errorRed,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        controller: _passwordController,
                        title: AppStrings.password,
                        textInputtype: TextInputType.visiblePassword,
                        isPassword: true,
                      ),
                      if (_passwordError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            _passwordError!,
                            style: Styles.ownerWidgetNameTextStyle.copyWith(
                              color: AppColors.errorRed,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Transform.scale(
                        scale: 18 / 20,
                        child: Checkbox(
                          activeColor: AppColors.kPrimaryColor,
                          value: _rememberMe,
                          onChanged: (bool? value) {
                            setState(() {
                              _rememberMe = value ?? false;
                            });
                          },
                        ),
                      ),
                      Text(AppStrings.rememberMe, style: Styles.descriptionTextStyle),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).push(AppRouter.kResetPassReqScreen);
                        },
                        child: Text(
                          AppStrings.forgotPassword,
                          style: Styles.actionTextStyle.copyWith(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(AppStrings.loginSuccess),
                          backgroundColor: AppColors.successGreen,
                        ),
                      );

                      if (state.role == 'owner') {
                        GoRouter.of(context).push(AppRouter.kMainOwnerScreen);
                      } else if (state.role == 'employee') {
                        GoRouter.of(context).push(AppRouter.kMainEmployeeScreen);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(AppStrings.unknownRole),
                            backgroundColor: AppColors.errorRed,
                          ),
                        );
                      }
                    } else if (state is AuthFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMessage),
                          backgroundColor: AppColors.errorRed,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  builder: (context, state) => CustomButton(
                    title: AppStrings.login,
                    onTap: () {
                      // _validateFields();
                      // if (_emailError == null && _passwordError == null) {
                      //   context.read<AuthCubit>().login(
                      //     _emailController.text.trim(),
                      //     _passwordController.text.trim(),
                      //     _rememberMe,
                      //   );
                      // }
                     Navigator.push(context, MaterialPageRoute(builder: (context) {
                       return const MainLayoutView();
                     },));
                    },
                  ),
                ),
                SizedBox(height: 260.h),
                const PrivacyUse(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateFields() {
    setState(() {
      _emailError = _emailController.text.isEmpty ? AppStrings.emailRequired : null;
      _passwordError =
      _passwordController.text.isEmpty ? AppStrings.passwordRequired : null;
    });
  }
}