import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_solutions_application/constants.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/core/utils/assets.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/widgets/show-alert.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_button.dart';
import 'package:smart_solutions_application/presentaion/widgets/simple_app_bar.dart';

class AddNotification3Screen extends StatefulWidget {
  const AddNotification3Screen({super.key});

  @override
  _AddNotification3ScreenState createState() => _AddNotification3ScreenState();
}

class _AddNotification3ScreenState extends State<AddNotification3Screen> {
  String facility = AppStrings.selectFacility.tr();
  String ownerName = AppStrings.selectOwnerName.tr();

  List<String> allFacilities = [
    AppStrings.allFacilities.tr(),
    AppStrings.facility1.tr(),
    AppStrings.facility2.tr(),
    AppStrings.facility3.tr(),
    AppStrings.facility4.tr(),
  ];
  List<String> selectedFacilities = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
  }

  void _showFacilitySelection(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white.withOpacity(0),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            List<String> filteredFacilities = allFacilities
                .where((facility) =>
            facility.contains(searchQuery) || searchQuery.isEmpty)
                .toList();

            return Container(
              height: 400.h,
              width: 343.w,
              child: Column(
                children: [
                  Container(
                    height: 57.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffF4F5F7),
                      border: Border.all(
                        color: const Color(0xffD7D7D7),
                        width: 0.6.w,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.search),
                          hintText: AppStrings.searchFacilityHint.tr(),
                          hintStyle: TextStyle(
                            color: const Color(0xffBDBDBD),
                            fontSize: 13.sp,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredFacilities.length,
                      itemBuilder: (context, index) {
                        String facilityName = filteredFacilities[index];
                        bool isSelected =
                        selectedFacilities.contains(facilityName);

                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xffD7D7D7),
                              width: 0.6.w,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 27.w),
                            child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(
                                textAlign: TextAlign.center,
                                facilityName,
                                style: TextStyle(color: kPrimaryColor),
                              ),
                              value: isSelected,
                              checkColor: Colors.white,
                              activeColor: const Color(0xff4318FF),
                              onChanged: (value) {
                                setState(() {
                                  if (value == true) {
                                    selectedFacilities.add(facilityName);
                                    this.setState(() {
                                      facility = selectedFacilities.join(', ');
                                    });
                                  } else {
                                    selectedFacilities.remove(facilityName);
                                    this.setState(() {
                                      facility = selectedFacilities.isEmpty
                                          ? AppStrings.selectFacility.tr()
                                          : selectedFacilities.join(', ');
                                    });
                                  }
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 330.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: const Color(0xffF2F2F7),
                      ),
                      child: Center(
                        child: Text(
                          AppStrings.cancel.tr(),
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showOwnerSelection(BuildContext context) {
    List<String> allOwners = [
      AppStrings.ownerNamePlaceholder.tr(),
      AppStrings.ownerNamePlaceholder.tr() + ' 1',
      AppStrings.ownerNamePlaceholder.tr() + ' 2',
      AppStrings.ownerNamePlaceholder.tr() + ' 3',
    ];
    List<String> selectedOwners = [];

    showModalBottomSheet(
      backgroundColor: Colors.white.withOpacity(0),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            List<String> filteredOwners = allOwners
                .where((owner) =>
            owner.contains(searchQuery) || searchQuery.isEmpty)
                .toList();

            return Container(
              height: 400.h,
              width: 343.w,
              child: Column(
                children: [
                  Container(
                    height: 57.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffF4F5F7),
                      border: Border.all(
                        color: const Color(0xffD7D7D7),
                        width: 0.6.w,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.search),
                          hintText: AppStrings.searchOwnerHint.tr(),
                          hintStyle: TextStyle(
                            color: const Color(0xffBDBDBD),
                            fontSize: 13.sp,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredOwners.length,
                      itemBuilder: (context, index) {
                        String owner = filteredOwners[index];
                        bool isSelected = selectedOwners.contains(owner);

                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xffD7D7D7),
                              width: 0.6.w,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 27.w),
                            child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(
                                textAlign: TextAlign.center,
                                owner,
                                style: TextStyle(color: kPrimaryColor),
                              ),
                              value: isSelected,
                              checkColor: Colors.white,
                              activeColor: const Color(0xff4318FF),
                              onChanged: (value) {
                                setState(() {
                                  if (value == true) {
                                    selectedOwners.add(owner);
                                    this.setState(() {
                                      ownerName = selectedOwners.join(', ');
                                    });
                                  } else {
                                    selectedOwners.remove(owner);
                                    this.setState(() {
                                      ownerName = selectedOwners.isEmpty
                                          ? AppStrings.selectOwnerName.tr()
                                          : selectedOwners.join(', ');
                                    });
                                  }
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 7.5.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 343.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: const Color(0xffF2F2F7),
                      ),
                      child: Center(
                        child: Text(
                          AppStrings.cancel.tr(),
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: AppStrings.sendNotification.tr()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
                width: double.infinity,
              ),
              Text(
                AppStrings.enterOwnerDetails.tr(),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: kTextColorLight,
                ),
              ),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () {
                  _showOwnerSelection(context);
                },
                child: Container(
                  width: 343.w,
                  height: 46.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xffD9D9D9),
                      width: 0.5.w,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 14.h,
                      horizontal: 16.w,
                    ),
                    child: Row(
                      children: [
                        Text(
                          ownerName,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xffBDBDBD),
                          ),
                        ),
                        const Spacer(),
                        SvgPicture.asset(AppAssets.down),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: () {
                  _showFacilitySelection(context);
                },
                child: Container(
                  width: 343.w,
                  height: 46.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xffD9D9D9),
                      width: 0.5.w,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 14.h,
                      horizontal: 16.w,
                    ),
                    child: Row(
                      children: [
                        Text(
                          facility,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xffBDBDBD),
                          ),
                        ),
                        const Spacer(),
                        SvgPicture.asset(AppAssets.down),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                AppStrings.addAttachments.tr(),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: kTextColorLight,
                ),
              ),
              SizedBox(height: 4.h),
              Container(
                width: 343.w,
                height: 133.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xffD9D9D9),
                    width: 0.5.w,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppAssets.addPhoto),
                    SizedBox(height: 8.h),
                    SizedBox(
                      width: 150.w,
                      child: Text(
                        AppStrings.uploadImageHint.tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xffBDBDBD),
                          letterSpacing: -0.17 / 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 284.h),
              CustomButton(
                onTap: () {
                  showAlertDialog(
                    context,
                    AppStrings.notificationSentSuccessTitle.tr(),
                    AppStrings.notificationSentSuccessMessage.tr(),
                  );
                },
                title: AppStrings.continueButton.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}