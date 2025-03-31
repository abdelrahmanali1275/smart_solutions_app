import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_solutions_application/constants.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/core/utils/assets.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/widgets/search_before_widget.dart';

import '../../../../core/utils/app_colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isBefore = true;
  bool isTab = false;
  bool isEmpty = false;
  bool isChanging = false;

  List<String> previousSearches = [
    AppStrings.sampleSearch1.tr(),
    AppStrings.sampleSearch2.tr(),
    AppStrings.sampleSearch3.tr(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: isTab ? 311.w : 343.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: AppColors.searchBoxBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              onTap: () {
                                setState(() {
                                  isTab = true;
                                });
                              },
                              onChanged: (value) {
                                setState(() {
                                  isChanging = true;
                                  isBefore = false;
                                });
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppStrings.searchHint.tr(),
                                hintStyle: TextStyle(
                                  color: AppColors.searchHintText,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              AppAssets.search,
                              width: 15.w,
                              height: 15.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  if (isTab)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isTab = false;
                          isBefore = true;
                          isChanging = false;
                        });
                      },
                      child: Text(
                        AppStrings.cancel.tr(),
                        style: TextStyle(
                          color: kPrimaryColor, // Not in AppColors yet
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: isEmpty ? 176.h : 16.h),
              if (isEmpty)
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.noSearch),
                      Text(
                        AppStrings.noResultsFound.tr(),
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                          color: kTextColorLight, // Not in AppColors yet
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          AppStrings.tryAgain.tr(),
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                            color: kPrimaryColor, // Not in AppColors yet
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (isChanging)
                Text(
                  AppStrings.searchResultsFor.tr(),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black,
                  ),
                ),
              if (isBefore)
                Text(
                  AppStrings.previousSearches.tr(),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black,
                  ),
                ),
              SizedBox(height: 16.h),
              if (isChanging)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.owners.tr(),
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: kTextColorLight, // Not in AppColors yet
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Container(
                          width: 26.w,
                          height: 26.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(AppAssets.profilePlaceholder),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          AppStrings.sampleOwnerName.tr(),
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: kTextColorLight, // Not in AppColors yet
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      width: 343.w,
                      height: 0.5.h,
                      color: AppColors.dividerLine,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      AppStrings.facilities.tr(),
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: kTextColorLight, // Not in AppColors yet
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Container(
                          width: 26.w,
                          height: 26.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Image.asset(
                            AppAssets.facilityPlaceholder,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          AppStrings.sampleFacilityName.tr(),
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: kTextColorLight, // Not in AppColors yet
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              if (isBefore)
                Expanded(
                  child: ListView.builder(
                    itemCount: previousSearches.length,
                    itemBuilder: (context, index) {
                      return SearchBeforeWidget(
                        title: previousSearches[index],
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}