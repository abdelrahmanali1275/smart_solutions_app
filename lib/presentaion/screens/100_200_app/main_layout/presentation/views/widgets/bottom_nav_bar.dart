import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../../../core/utils/app_constants.dart';
import '../../view_model/change_nav_bar_status/change_nav_bar_status_cubit.dart';
import 'bottom_nav_bar_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 30,
      child: BlocBuilder<ChangeNavBarStatusCubit, ChangeNavBarStatusState>(
        builder: (context, state) {
          var c = context.read<ChangeNavBarStatusCubit>();
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.width15(context),
              vertical: AppConstants.height15(context),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                5,
                    (index) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.width5(context),
                  ),
                  child: BottomNavBarItem(
                    icon:  c.icons[index],
                    selectedIcon:  c.selectedIcons[index],
                    index: index, label: c.labels[index],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
