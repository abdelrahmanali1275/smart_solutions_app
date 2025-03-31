import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/presentaion/screens/owner_app/screens/employee_screen.dart';

class EmployeeWidget extends StatelessWidget {
  const EmployeeWidget({
    super.key,
    required this.title,
    required this.des,
    this.image,
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.status,
  });

  final String title;
  final String des;
  final String? image;
  final String name;
  final String email;
  final String phone;
  final String location;
  final String status;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EmployeeScreen(
              name: name,
              email: email,
              phone: phone,
              location: location,
              status: status,
              imageUrl: image,
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 8.h),
        child: Container(
          width: 327.w,
          height: 74.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 0.3, color: const Color(0xffC4C4C4)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 43.w,
                  height: 43.h,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: image != null && image!.isNotEmpty
                      ? Image.network(
                          image!,
                          width: 43.w,
                          height: 43.h,
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.person,
                          size: 43,
                          color: Colors.grey,
                        ),
                ),
                SizedBox(width: 8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: const Color(0xff333333),
                          fontWeight: FontWeight.w700,
                          letterSpacing: -2 / 100),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      des,
                      style: TextStyle(
                          fontSize: 9.sp,
                          color: const Color(0xff333333),
                          fontWeight: FontWeight.w400,
                          letterSpacing: -2 / 100),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
