import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_solutions_application/core/utils/app_router.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/drawer_screens/admin_profile.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/warnings_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/employee_app/screens/home_employee_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/employee_app/screens/my_services_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/employee_app/widgets/bottom_employee_widget.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_app_bar.dart';

import '../../../../core/utils/assets.dart';

class MainEmployeeScreen extends StatefulWidget {
  const MainEmployeeScreen({super.key});

  @override
  _MainEmployeeScreenState createState() => _MainEmployeeScreenState();
}

class _MainEmployeeScreenState extends State<MainEmployeeScreen> {
  int _selectedIndex = 0;
  String _userName = AppStrings.ownerNamePlaceholder;
  String _userRole = AppStrings.noDescription;
  String _userAvatar = '';

  final List<String> _titles = [
    AppStrings.overView,
    AppStrings.services,
    AppStrings.warnings,
    AppStrings.adminProfile
  ];
  final List<Widget> _pages = [
    const HomeEmployeeScreen(),
    const MyServicesScreen(),
    WarningsScreen(),
    const AdminProfile(
      isBottom: true,
    )
  ];

  @override
  void initState() {
    super.initState();
    _fetchUserName();
  }

  Future<void> _fetchUserName() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userDataString = prefs.getString('userData');

      if (userDataString != null) {
        final Map<String, dynamic> userData =
        Map<String, dynamic>.from(json.decode(userDataString));
        setState(() {
          _userName = userData['name'] ?? AppStrings.ownerNamePlaceholder;
          _userRole = userData['role'] == 'employee' ? AppStrings.admin : AppStrings.owner;
          _userAvatar = userData['avatar'] ?? '';
        });
      }
    } catch (e) {
      print('Error fetching user name: $e');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: _titles[_selectedIndex]),
      body: _pages[_selectedIndex],
      drawer: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
        child: Drawer(
          child: SafeArea(
            child: ListView(
              padding: EdgeInsets.only(top: 0.h, right: 24.w, left: 22.w),
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      width: 33.w,
                      height: 32,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      child: _userAvatar.isNotEmpty
                          ? Image.network(
                        _userAvatar,
                        fit: BoxFit.cover,
                      )
                          : const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _userName,
                          style: Styles.ownerNameTextStyle,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          _userRole,
                          style: Styles.descriptionTextStyle,
                        ),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      AppAssets.settings,
                      color: AppColors.black,
                    )
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  width: 254.w,
                  height: 0.3.h,
                  color: AppColors.searchHintText,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: SvgPicture.asset(AppAssets.home),
                  title: Text(
                    AppStrings.overView,
                    style: Styles.ownerWidgetNameTextStyle.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: SvgPicture.asset(AppAssets.profile),
                  title: Text(
                    AppStrings.adminProfile,
                    style: Styles.ownerWidgetNameTextStyle.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: SvgPicture.asset(AppAssets.services),
                  title: Text(
                    AppStrings.services,
                    style: Styles.ownerWidgetNameTextStyle.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: SvgPicture.asset(AppAssets.privacy),
                  title: Text(
                    AppStrings.privacy,
                    style: Styles.ownerWidgetNameTextStyle.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kPrivacyScreen);
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: SvgPicture.asset(AppAssets.policy),
                  title: Text(
                    AppStrings.policy,
                    style: Styles.ownerWidgetNameTextStyle.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kTermsUse);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomEmployeeWidget(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}