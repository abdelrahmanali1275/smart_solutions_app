import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key, required this.image, required this.title});
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(image),
          SizedBox(
            height: 24.h,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12.sp, color: const Color(0xff717171)),
          )
        ],
      ),
    );
  }
}
