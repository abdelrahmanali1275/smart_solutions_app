import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_solutions_application/constants.dart';
import 'package:smart_solutions_application/core/utils/app_router.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/warnings_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/owner_app/screens/employees_main_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/owner_app/screens/history_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/owner_app/screens/home_owner_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/owner_app/widgets/bottom_nav_bar.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_app_bar.dart';

import '../../../../core/utils/assets.dart';

class MainOwnerScreen extends StatefulWidget {
  @override
  _MainOwnerScreenState createState() => _MainOwnerScreenState();
}

class _MainOwnerScreenState extends State<MainOwnerScreen> {
  int _selectedIndex = 0;
  String? userName;
  String? userAvatar;
  String? userRole;
  bool _isLoadingUserData = true;
  String? _errorMessage;

  final List<String> _titles = [
    AppStrings.homeTitle,
    AppStrings.employeesTitle,
    AppStrings.warningsTitle,
    AppStrings.historyTitle,
  ];

  final List<Widget> _pages = [
    const HomeOwnerScreen(),
    const EmployeesMainScreen(),
    WarningsScreen(),
    const HistoryScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  /// استرجاع بيانات المستخدم
  Future<void> _fetchUserData() async {
    try {
      setState(() => _isLoadingUserData = true);
      final prefs = await SharedPreferences.getInstance();
      final userDataString = prefs.getString('userData');

      if (userDataString == null) {
        throw Exception('No user data found in SharedPreferences');
      }

      final Map<String, dynamic> userData =
      Map<String, dynamic>.from(json.decode(userDataString));

      setState(() {
        userName = userData['name'] ?? AppStrings.unknownUser;
        userAvatar = userData['avatar'];
        userRole = userData['role'] == 'owner' ? AppStrings.ownerRole : AppStrings.unknownUser;
        _isLoadingUserData = false;
      });
    } catch (e) {
      print('Error fetching user data: $e');
      setState(() {
        _errorMessage = AppStrings.errorLoadingData;
        _isLoadingUserData = false;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // RTL support for Arabic
      child: Scaffold(
        appBar: CustomAppBar(title: _titles[_selectedIndex]),
        body: _pages[_selectedIndex],
        drawer: _buildDrawer(),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        bottomLeft: Radius.circular(30),
      ),
      child: Drawer(
        child: SafeArea(
          child: _isLoadingUserData
              ? const Center(child: CircularProgressIndicator())
              : _errorMessage != null
              ? _buildErrorWidget()
              : _buildDrawerContent(),
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_errorMessage!, style: TextStyle(fontSize: 14.sp)),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: _fetchUserData,
            child: const Text('إعادة المحاولة'),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerContent() {
    return ListView(
      padding: EdgeInsets.only(top: 0.h, right: 24.w, left: 22.w),
      children: [
        _buildDrawerHeader(),
        SizedBox(height: 16.h),
        _buildDivider(),
        _buildDrawerItem(
          icon: AppAssets.home,
          title: AppStrings.homePage,
          onTap: () {
            setState(() => _selectedIndex = 0);
            Navigator.pop(context);
          },
        ),
        _buildDrawerItem(
          icon: AppAssets.profile,
          title: AppStrings.userProfile,
          onTap: () {
            GoRouter.of(context).push(AppRouter.kAdminProfile);
            Navigator.pop(context);
          },
        ),
        _buildDrawerItem(
          icon: AppAssets.services,
          title: AppStrings.services,
          onTap: () {
            GoRouter.of(context).push(AppRouter.kServicesSecreen);
            Navigator.pop(context);
          },
        ),
        _buildDrawerItem(
          icon: AppAssets.privacy,
          title: AppStrings.privacyPolicy,
          onTap: () {
            GoRouter.of(context).push(AppRouter.kPrivacyScreen);
            Navigator.pop(context);
          },
        ),
        _buildDrawerItem(
          icon: AppAssets.policy,
          title: AppStrings.termsOfUse,
          onTap: () {
            GoRouter.of(context).push(AppRouter.kTermsUse);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget _buildDrawerHeader() {
    return Row(
      children: [
        Container(
          width: 33.w,
          height: 32,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          child: userAvatar != null && userAvatar!.isNotEmpty
              ? Image.network(
            userAvatar!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.person),
          )
              : const Icon(Icons.person),
        ),
        SizedBox(width: 7.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName ?? AppStrings.unknownUser,
              style: TextStyle(
                color: kTextColorLight,
                fontSize: 10.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.2,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              userRole ?? AppStrings.unknownUser,
              style: TextStyle(
                color: kTextColorLight,
                fontSize: 8.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.2,
              ),
            ),
          ],
        ),
        const Spacer(),
        SvgPicture.asset(
          AppAssets.settings,
          color: Colors.black,
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 254.w,
      height: 0.3.h,
      color: const Color(0xffBDBDBD),
    );
  }

  Widget _buildDrawerItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 12.sp,
          letterSpacing: -0.2,
          color: const Color(0xff333333),
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: onTap,
    );
  }
}