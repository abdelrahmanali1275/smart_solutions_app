import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBar(
      {super.key,
      required this.title,
      this.titleColorl = Colors.black,
      this.hasAcc = false,
      this.acction,
      this.fun});
  final String title;
  final Color titleColorl;
  final bool hasAcc;
  final Widget? acction;
  final VoidCallback? fun;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.h, right: 16.w, left: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: titleColorl,
                )),
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
              color: titleColorl,
              height: 32 /
                  14, // Line height: Line height divided by font size (for example, 32px / 16px)
              letterSpacing: -2 /
                  100 *
                  14.sp, // Letter spacing is -2%, which is negative spacing
            ),
          ),
          Spacer(),
          if (hasAcc) GestureDetector(onTap: fun, child: acction)
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
