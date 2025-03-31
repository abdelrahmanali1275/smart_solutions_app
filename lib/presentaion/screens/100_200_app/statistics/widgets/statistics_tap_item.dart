import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../manager/statistics__cubit.dart';

class StatisticsTapItem extends StatelessWidget {
  const StatisticsTapItem({
    super.key,
    required this.title,
    this.onTap,
    required this.index,
  });

  final Function()? onTap;
  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.width15(context),
          vertical: AppConstants.height15(context),
        ),
        decoration: BoxDecoration(
          color: context.read<StatisticsCubit>().selectedTab == index
              ? AppColors.kPrimaryColor
              : AppColors.white,
          borderRadius: BorderRadius.circular(AppConstants.width15(context)),
          border: Border.all(color: const Color(0xffF1F5F9)),
          boxShadow: context.read<StatisticsCubit>().selectedTab == index
              ? null
              : const [
            BoxShadow(
              color: Color(0xffF1F5F9),
              blurRadius: 8,
              spreadRadius: 0,
              offset: Offset(0, 8),
            )
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: context.read<StatisticsCubit>().selectedTab == index
                  ? Colors.white
                  : AppColors.black,
              fontSize: MediaQuery.of(context).size.height * .014,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}