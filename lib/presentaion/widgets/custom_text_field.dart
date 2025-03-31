import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_solutions_application/core/utils/assets.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.title,
      this.isPassword = false,
      required this.textInputtype,
      this.width = 343,
      this.controller});

  final String title;
  final bool isPassword;
  final TextInputType textInputtype;
  final double width;
  final TextEditingController? controller;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 0.h,
        right: 16.w,
      ),
      width: widget.width.w,
      height: 46.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffD9D9D9), width: 0.5.w),
      ),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.textInputtype,
        obscureText: widget.isPassword ? _isObscured : false,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: SvgPicture.asset(
                    _isObscured
                        ? AppAssets.eyeNotVisible
                        : AppAssets.eyeVisible,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
              : null,
          hintText: widget.title,
          hintStyle: TextStyle(
            fontSize: 12.sp,
            color: const Color(0xffBDBDBD),
          ),
        ),
      ),
    );
  }
}
