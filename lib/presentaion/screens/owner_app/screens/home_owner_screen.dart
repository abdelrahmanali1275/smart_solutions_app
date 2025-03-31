import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_solutions_application/constants.dart';
import 'package:smart_solutions_application/core/utils/app_router.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart'; // New import
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/widgets/facility_widget.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/widgets/home_widget.dart';

import '../../../../core/utils/assets.dart';

class HomeOwnerScreen extends StatefulWidget {
  const HomeOwnerScreen({super.key});

  @override
  State<HomeOwnerScreen> createState() => _HomeOwnerScreenState();
}

class _HomeOwnerScreenState extends State<HomeOwnerScreen> {
  Map<String, dynamic>? _userData;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      setState(() => _isLoading = true);
      final prefs = await SharedPreferences.getInstance();
      final userDataString = prefs.getString('userData');

      if (userDataString == null) {
        throw Exception('No user data found in SharedPreferences');
      }

      final Map<String, dynamic> userData =
      Map<String, dynamic>.from(json.decode(userDataString));
      setState(() {
        _userData = userData;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching user data: $e');
      setState(() {
        _errorMessage = AppStrings.errorLoadingData;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_errorMessage!, style: TextStyle(fontSize: 14.sp)),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: _fetchUserData,
              child: const Text(AppStrings.retryButton),
            ),
          ],
        ),
      );
    }

    return Directionality(
      textDirection: TextDirection.rtl, // RTL support for Arabic
      child: Padding(
        padding: EdgeInsets.only(top: 7.h, right: 16.w, left: 16.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildStatisticsGrid()),
            SliverToBoxAdapter(child: SizedBox(height: 40.h)),
            SliverToBoxAdapter(child: _buildFacilitiesHeader(context)),
            SliverToBoxAdapter(child: SizedBox(height: 8.h)),
            _buildFacilitiesList(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1.6,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        HomeWidget(
          title: AppStrings.totalFacilitiesTitle,
          num: _userData?['count_facilities']?.toString() ?? '0',
          des: AppStrings.totalFacilitiesDescription,
          pic: AppAssets.ownersAll,
        ),
        HomeWidget(
          title: AppStrings.totalServicesTitle,
          num: _userData?['total_services']?.toString() ?? '0',
          des: AppStrings.totalServicesDescription,
          pic: AppAssets.ownerServices,
        ),
        HomeWidget(
          title: AppStrings.totalEmployeesTitle,
          num: _userData?['count_employees']?.toString() ?? '0',
          des: AppStrings.totalEmployeesDescription,
          pic: AppAssets.homeFacilities,
        ),
        HomeWidget(
          title: AppStrings.pendingServicesTitle,
          num: _userData?['pending_services']?.toString() ?? '0',
          des: AppStrings.pendingServicesDescription,
          pic: AppAssets.servicesAvailable,
        ),
      ],
    );
  }

  Widget _buildFacilitiesHeader(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.yourFacilitiesTitle,
          style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 16.sp,
              color: Colors.black),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kAddFacilityScreen1);
          },
          child: Text(
            AppStrings.addNewFacility,
            style: TextStyle(fontSize: 11.sp, color: kPrimaryColor),
          ),
        ),
      ],
    );
  }

  Widget _buildFacilitiesList() {
    if (_userData?['facilities'] == null || _userData!['facilities'].isEmpty) {
      return SliverToBoxAdapter(
        child: Center(
          child: Text(
            AppStrings.noFacilitiesMessage,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          final facility = _userData!['facilities'][index];
          return FacilityWidget(
            nameF: facility['name'] ?? AppStrings.defaultFacilityName,
            nameOwner: _userData!['name'] ?? AppStrings.defaultOwnerName,
            desName: AppStrings.ownerDescription,
            city: facility['city'] ?? AppStrings.defaultCity,
            services: [],
          );
        },
        childCount: _userData!['facilities'].length,
      ),
    );
  }
}