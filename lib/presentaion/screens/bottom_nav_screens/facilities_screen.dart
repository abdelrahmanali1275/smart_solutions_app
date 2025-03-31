import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/core/utils/assets.dart';
import 'package:smart_solutions_application/presentaion/manager/facilities_cubit/facilities_cubit.dart';
import 'package:smart_solutions_application/presentaion/manager/facilities_cubit/facilities_state.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/widgets/facility_widget.dart';
import 'package:smart_solutions_application/presentaion/screens/owner_app/screens/empty_screen.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/styles.dart';

class FacilitiesScreen extends StatefulWidget {
  const FacilitiesScreen({super.key});

  @override
  State<FacilitiesScreen> createState() => _FacilitiesScreenState();
}

class _FacilitiesScreenState extends State<FacilitiesScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FacilitiesCubit>(context).fetchFacility();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FacilitiesCubit, FacilityState>(
      builder: (context, state) {
        if (state is FacilityLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (state is FacilityFailure) {
          return Center(
            child: Text(
              '${AppStrings.errorMessage}: ${state.errorMessage}',
              style: Styles.errorTextStyle,
            ),
          );
        } else if (state is FacilitySuccess) {
          final facilities = state.facilities;

          if (facilities.isEmpty) {
            return const Center(
              child: EmptyScreen(
                image: AppAssets.noFacilities,
                title: AppStrings.noFacilities,
              ),
            );
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ListView.builder(
              itemCount: facilities.length,
              itemBuilder: (context, index) {
                final facility = facilities[index];
                return FacilityWidget(
                  nameF: facility.name,
                  city: facility.cityName ?? AppStrings.unknown,
                  nameOwner: facility.ownerName ?? AppStrings.unknown,
                  desName: AppStrings.facilityOwner,
                  services: [],
                );
              },
            ),
          );
        } else {
          return const Center(child: Text(AppStrings.unknownState));
        }
      },
    );
  }
}


