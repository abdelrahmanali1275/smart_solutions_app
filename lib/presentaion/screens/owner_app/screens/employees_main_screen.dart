import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/presentaion/manager/employees_cubit/employees_cubit.dart';
import 'package:smart_solutions_application/presentaion/manager/employees_cubit/employees_state.dart';
import 'package:smart_solutions_application/presentaion/screens/owner_app/widgets/employee_widget.dart';

class EmployeesMainScreen extends StatelessWidget {
  const EmployeesMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeCubit, EmployeeState>(
      builder: (context, state) {
        if (state is EmployeeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is EmployeeLoaded) {
          final employees = state.employees;
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16.h),
                ...employees.map(
                      (employee) => EmployeeWidget(
                    title: employee.name,
                    des: employee.city?.nameAr ?? AppStrings.notAvailable,
                    image: employee.avatar,
                    name: employee.name,
                    email: employee.email,
                    phone: employee.phone,
                    location: employee.city?.nameAr ?? AppStrings.notAvailable,
                    status: employee.status,
                  ),
                ),
              ],
            ),
          );
        } else if (state is EmployeeError) {
          return Center(
            child: Text(
              state.message,
              style: Styles.descriptionTextStyle.copyWith(
                color: AppColors.errorRed,
              ),
            ),
          );
        }
        return Center(
          child: Text(
            AppStrings.noDataAvailable,
            style: Styles.descriptionTextStyle.copyWith(
              color: AppColors.grey,
            ),
          ),
        );
      },
    );
  }
}