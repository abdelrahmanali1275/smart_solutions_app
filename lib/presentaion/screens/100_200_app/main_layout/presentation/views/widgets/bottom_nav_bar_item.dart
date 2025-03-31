import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_constants.dart';
import '../../view_model/change_nav_bar_status/change_nav_bar_status_cubit.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.icon,
    required this.index,
    required this.selectedIcon, required this.label,
  });

  final String icon;
  final String selectedIcon;
  final String label;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ChangeNavBarStatusCubit.get(context).changeNavBarIndex(index);
      },
      child: Container(
        padding: EdgeInsets.all(AppConstants.sp10(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ChangeNavBarStatusCubit.get(context).currentIndex == index
                  ? selectedIcon
                  : icon,
              width: index == 2
                  ? MediaQuery.of(context).size.height * .04
                  : MediaQuery.of(context).size.height * .03,
            ),
            ChangeNavBarStatusCubit.get(context).currentIndex == index
                ?   Text(label,style: TextStyle(
              color: AppColors.kPrimaryColor
            ),):SizedBox()
          ],
        ),
      ),
    );
  }
}
