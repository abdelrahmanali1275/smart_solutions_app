import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_solutions_application/constants.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/core/utils/assets.dart';
import 'package:smart_solutions_application/data/models/employee_models/employee_model.dart';
import 'package:smart_solutions_application/data/models/user_model.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/widgets/profile_widget.dart';
import 'package:smart_solutions_application/presentaion/widgets/simple_app_bar.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({super.key, this.isBottom = false});
  final bool isBottom;

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  UserModel? _employee;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userDataString = prefs.getString('userData');

      if (userDataString != null) {
        final Map<String, dynamic> userData =
        Map<String, dynamic>.from(json.decode(userDataString));
        setState(() {
          _employee = UserModel.fromJson(userData);
        });
      } else {
        throw Exception(AppStrings.notAvailable.tr());
      }
    } catch (e) {
      print('Error fetching user data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${AppStrings.failedToLoadUserData.tr()}: $e',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_employee == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final employee = _employee!;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 194.h,
                  child: Image.asset(
                    AppAssets.profileImage,
                    fit: BoxFit.fill,
                  ),
                ),
                if (!widget.isBottom)
                  SimpleAppBar(
                    title: '',
                    titleColorl: Colors.white,
                  ),
                Positioned(
                  left: 156.w,
                  right: 154.w,
                  top: 140.h,
                  child: Container(
                    width: 65.w,
                    height: 65.h,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xffBDBDBD),
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child:
                    employee.avatar != null && employee.avatar!.isNotEmpty
                        ? Image.network(
                      employee.avatar!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    )
                        : Icon(Icons.person, size: 40.sp),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            Text(
              employee.name,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            ProfileWidget(
              icon: AppAssets.tel,
              text: employee.phone,
            ),
            ProfileWidget(
              icon: AppAssets.message,
              text: employee.email,
            ),
            ProfileWidget(
              icon: AppAssets.location,
              text: employee.address ?? AppStrings.notAvailable.tr(),
            ),
            ProfileWidget(
              isActive: true,
              icon: AppAssets.done,
              text: employee.status == 'ACTIVE'
                  ? AppStrings.active.tr()
                  : AppStrings.inactive.tr(),
            ),
          ],
        ),
      ),
    );
  }
}