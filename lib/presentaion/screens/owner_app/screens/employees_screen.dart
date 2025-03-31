import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/core/utils/assets.dart';
import 'package:smart_solutions_application/presentaion/screens/owner_app/screens/empty_screen.dart';
import 'package:smart_solutions_application/presentaion/widgets/simple_app_bar.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: AppStrings.employeeCompany.tr()),
      body: SingleChildScrollView(
        child: Column(
          children: isEmpty
              ? [
                  SizedBox(
                    height: 204.h,
                  ),
                  EmptyScreen(
                      image: AppAssets.noEmployees,
                      title: AppStrings.notAddEmployee.tr())
                ]
              : [
                  SizedBox(
                    height: 24.h,
                  ),
                  // OwnerWidget(
                  //   title: 'اسم الموظف',
                  //   isemp: true,
                  // ),
                  // OwnerWidget(
                  //   title: 'اسم الموظف',
                  //   isemp: true,
                  // ),
                  // OwnerWidget(
                  //   title: 'اسم الموظف',
                  //   isemp: true,
                  // ),
                  // OwnerWidget(
                  //   title: 'اسم الموظف',
                  //   isemp: true,
                  // ),
                  // OwnerWidget(
                  //   title: 'اسم الموظف',
                  //   isemp: true,
                  // ),
                  // OwnerWidget(
                  //   title: 'اسم الموظف',
                  //   isemp: true,
                  // ),
                  // OwnerWidget(
                  //   title: 'اسم الموظف',
                  //   isemp: true,
                  // ),
                  // OwnerWidget(
                  //   title: 'اسم الموظف',
                  //   isemp: true,
                  // ),
                  // OwnerWidget(
                  //   title: 'اسم الموظف',
                  //   isemp: true,
                  // ),
                ],
        ),
      ),
    );
  }
}
