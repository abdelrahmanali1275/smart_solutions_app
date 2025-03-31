import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/core/utils/app_router.dart';
import 'package:smart_solutions_application/core/utils/assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // shadowColor: Colors.grey.withOpacity(20 / 100),
      backgroundColor: Colors.white,
      titleSpacing: 0,

      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: SvgPicture.asset(AppAssets.drawer),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 16.sp, color: Colors.black),
      ),
      actions: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kSearchScreen);
          },
          icon: SvgPicture.asset(AppAssets.search),
        ),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kNotificationsScreen);
          },
          icon: SvgPicture.asset(AppAssets.notifications),
        ),
      ],
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
