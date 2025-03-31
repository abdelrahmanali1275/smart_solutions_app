import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/core/widgets/custom_error_message.dart';
import 'package:smart_solutions_application/core/widgets/custom_progress_indicator.dart';
import 'package:smart_solutions_application/presentaion/manager/owners_cubit/owners_cubit.dart';
import 'package:smart_solutions_application/presentaion/manager/owners_cubit/owners_state.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/widgets/owner_widget.dart';

class OwnersScreen extends StatefulWidget {
  @override
  State<OwnersScreen> createState() => _OwnersScreenState();
}

class _OwnersScreenState extends State<OwnersScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<OwnersCubit>(context).featchOwners();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OwnersCubit, OwnersState>(
      builder: (context, state) {
        if (state is OwnersSuccess) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
            itemCount: state.owners.length,
            itemBuilder: (context, index) {
              final owner = state.owners[index];
              return OwnerWidget(
                title: owner.name ?? AppStrings.notAvailable,
                imageUrl: owner.avatar,
                ownerData: {
                  'name': owner.name,
                  'avatar': owner.avatar,
                  'location': owner.address ?? AppStrings.notAvailable,
                  'facilities': owner.facilities?.length ?? 0,
                  'employees': 0,
                  'phone': owner.phone,
                  'email': owner.email,
                  'address': owner.address ?? AppStrings.notAvailable,
                  'status': owner.status,
                },
              );
            },
          );
        } else if (state is OwnersFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return CustomProgressIndicator();
        }
      },
    );
  }
}