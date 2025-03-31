import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';

import '../../../../core/utils/assets.dart';

class MyServicesScreen extends StatefulWidget {
  const MyServicesScreen({super.key});

  @override
  State<MyServicesScreen> createState() => _MyServicesScreenState();
}

class _MyServicesScreenState extends State<MyServicesScreen> {
  List<Map<String, dynamic>>? _services;

  @override
  void initState() {
    super.initState();
    _fetchServices();
  }

  void _fetchServices() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userDataString = prefs.getString('userData');

      if (userDataString != null) {
        final Map<String, dynamic> userData =
        Map<String, dynamic>.from(json.decode(userDataString));
        final List<dynamic>? servicesList = userData['services'];

        setState(() {
          _services = servicesList != null
              ? servicesList.map((e) => Map<String, dynamic>.from(e)).toList()
              : [];
        });
      } else {
        throw Exception(AppStrings.failedToLoadUserData);
      }
    } catch (e) {
      print('Error fetching services: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${AppStrings.errorPrefix}: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          AppStrings.services,
          style: Styles.facilityNameTextStyle.copyWith(
            fontSize: 15.sp,
          ),
        ),
      ),
      body: _services == null
          ? const Center(child: CircularProgressIndicator())
          : _services!.isEmpty
          ? Center(
        child: Text(
          AppStrings.noServicesAvailable,
          style: Styles.descriptionTextStyle.copyWith(
            fontSize: 16.sp,
            color: AppColors.grey,
          ),
        ),
      )
          : Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Column(
            children: _services!
                .map(
                  (service) => Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: FacilityServiceWidget(
                  icon: AppAssets.services,
                  serviceName: service['name'] ?? AppStrings.noServicesAvailable,
                  installationDuration:
                  service['duration'] ?? AppStrings.notAvailable,
                  price: service['price'] ?? AppStrings.notAvailable,
                  plan: service['plan'] ?? AppStrings.notAvailable,
                ),
              ),
            )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class FacilityServiceWidget extends StatelessWidget {
  final String icon;
  final String serviceName;
  final String installationDuration;
  final String price;
  final String plan;

  const FacilityServiceWidget({
    super.key,
    required this.icon,
    required this.serviceName,
    required this.installationDuration,
    required this.price,
    required this.plan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderGrey, width: 0.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.whiteShadow.withOpacity(0.18),
            offset: const Offset(1, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.miscellaneous_services, size: 20, color: AppColors.kPrimaryColor),
              const SizedBox(width: 8),
              Text(
                serviceName,
                style: Styles.facilityNameTextStyle,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Divider(color: AppColors.dividerLine),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoBox(AppStrings.installationDurationLabel, installationDuration),
              _infoBox(AppStrings.priceLabel, price),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Text(
                AppStrings.planLabel,
                style: Styles.labelTextStyle,
              ),
              SizedBox(width: 8.w),
              Text(
                plan,
                style: Styles.valueTextStyle.copyWith(color: AppColors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoBox(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.lightBlueGrey,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderGrey),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: Styles.labelTextStyle,
          ),
          Text(
            value,
            style: Styles.valueTextStyle,
          ),
        ],
      ),
    );
  }
}