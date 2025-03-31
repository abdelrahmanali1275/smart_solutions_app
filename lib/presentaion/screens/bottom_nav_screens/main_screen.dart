import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_solutions_application/core/utils/app_router.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/presentaion/manager/admin_profile_cubit/admin_profile_cubit.dart';
import 'package:smart_solutions_application/presentaion/manager/admin_profile_cubit/admin_profile_state.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/facilities_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/home_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/owners_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/warnings_screen.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_app_bar.dart';
import 'package:smart_solutions_application/presentaion/widgets/bottom_nav_bar.dart';

import '../../../core/utils/assets.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<String> _titles = [
    AppStrings.overView,
    AppStrings.facilities,
    AppStrings.owners,
    AppStrings.warnings
  ];
  final List<Widget> _pages = [
    const HomeScreen(),
    FacilitiesScreen(),
    OwnersScreen(),
    WarningsScreen()
  ];

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
                  BlocBuilder<AdminProfileCubit, AdminProfileState>(
                    builder: (context, state) {
                      if (state is AdminProfileLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is AdminProfileSuccess) {
                        final user = state.user;
                        return Row(
                          children: [
                            Container(
                                width: 33.w,
                                height: 32,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.grey),
                                child: user.avatar != null
                                    ? Image.network(user.avatar!,
                                    fit: BoxFit.cover)
                                    : Icon(Icons.person)),
                            SizedBox(
                              width: 7.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.name,
                                  style: Styles.ownerNameTextStyle,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  AppStrings.admin,
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
                        );
                      } else if (state is AdminProfileError) {
                        return Text(
                          AppStrings.failedToLoadUserData,
                          style: Styles.descriptionTextStyle.copyWith(
                            color: Colors.red,
                            fontSize: 14.sp,
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
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
                      GoRouter.of(context).push(AppRouter.kAdminProfile);
                    },
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset(AppAssets.facilitesD),
                    title: Text(
                      AppStrings.facilities,
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
                    leading: SvgPicture.asset(AppAssets.services),
                    title: Text(
                      AppStrings.services,
                      style: Styles.ownerWidgetNameTextStyle.copyWith(
                        color: AppColors.darkGrey,
                      ),
                    ),
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kServicesSecreen);
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
          )),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}