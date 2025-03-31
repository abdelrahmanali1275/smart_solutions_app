import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar100 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? imagePath;
  final Widget? widget;

  const CustomAppBar100({
    super.key,
    required this.title,
    this.imagePath,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      titleSpacing: 0,
      leading: const SizedBox(),
      actions: [
     widget ??   Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: imagePath != null
                ? AssetImage(imagePath!)
                : const AssetImage('assets/images/default_avatar.png'),
          ),
        )
      ],
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16.sp,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
