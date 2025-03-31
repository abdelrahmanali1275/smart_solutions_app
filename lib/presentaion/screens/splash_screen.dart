import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_solutions_application/core/utils/app_router.dart';
import 'package:smart_solutions_application/core/utils/assets.dart';
import 'package:smart_solutions_application/presentaion/screens/water_system/pages/hh.dart';
import 'package:smart_solutions_application/presentaion/screens/water_system/pages/water_Leakage_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/water_system/pages/water_home_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/water_system/pages/water_report_screeen.dart';
import 'package:smart_solutions_application/presentaion/screens/water_system/pages/water_seiting_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _checkLoginStatus(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffCF6AFF),
              Color(0xff6824D8),
            ],
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            tileMode: TileMode.repeated,
          ),
        ),
        child: Center(
          child: Image.asset(AppAssets.logo),
        ),
      ),
    );
  }

  /// دالة للتحقق من وجود التوكن والدور
  Future<void> _checkLoginStatus(BuildContext context) async {




    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token'); // استرجاع التوكن
    final role = prefs.getString('role'); // استرجاع الدور

    Future.delayed(const Duration(seconds: 3), () {


      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>
          DashboardScreen(),), (route) => true,);


      // if (token != null && token.isNotEmpty && role != null) {
      //   // التوجيه بناءً على الدور
      //   if (role == 'owner') {
      //     GoRouter.of(context).pushReplacement(AppRouter.kMainOwnerScreen);
      //   } else if (role == 'employee') {
      //     GoRouter.of(context).pushReplacement(AppRouter.kMainEmployeeScreen);
      //   } else {
      //     // إذا كان الدور غير معروف، انتقل إلى شاشة تسجيل الدخول
      //     GoRouter.of(context).pushReplacement(AppRouter.kLoginScreen);
      //   }
      // } else {
      //   // إذا لم يكن هناك توكن، انتقل إلى شاشة تسجيل الدخول
      //   GoRouter.of(context).pushReplacement(AppRouter.kLoginScreen);
      // }
    });
  }
}
