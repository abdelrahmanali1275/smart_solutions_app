import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/widgets/facility_widget.dart';

class HomeEmployeeScreen extends StatefulWidget {
  const HomeEmployeeScreen({super.key});


  @override
  State<HomeEmployeeScreen> createState() => _HomeEmployeeScreenState();
}

class _HomeEmployeeScreenState extends State<HomeEmployeeScreen> {
  Map<String, dynamic>? _facility;
  List<String> _images = [];

  @override
  void initState() {
    super.initState();
    _fetchFacilityData();
  }

  void _fetchFacilityData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userDataString = prefs.getString('userData');

      if (userDataString != null) {
        final Map<String, dynamic> userData =
        Map<String, dynamic>.from(json.decode(userDataString));

        final facilityData = userData['facility'];
        if (facilityData != null && facilityData['images'] != null) {
          _images = List<String>.from(json.decode(facilityData['images']));
        }

        setState(() {
          _facility = facilityData;
        });
      } else {
        throw Exception(AppStrings.failedToLoadUserData);
      }
    } catch (e) {
      print('Error fetching facility data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${AppStrings.errorPrefix}: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, right: 16.w, left: 16.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.facilities,
              style: Styles.descriptionTextStyle.copyWith(
                color: AppColors.kTextColorLight,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 16.h),
            if (_facility == null)
              const Center(child: CircularProgressIndicator())
            else
              FacilityWidget(
                nameF: _facility!['name'] ?? AppStrings.sampleFacilityName,
                nameOwner: AppStrings.owner,
                desName: AppStrings.noDescription,
                city: _facility!['address'] ?? AppStrings.notAvailable,
                services: [],
              ),
          ],
        ),
      ),
    );
  }
}