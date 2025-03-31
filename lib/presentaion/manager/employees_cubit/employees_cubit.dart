import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_solutions_application/data/repos/employee/employee_repo.dart';
import 'package:smart_solutions_application/presentaion/manager/employees_cubit/employees_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  final EmployeeRepository repository;

  EmployeeCubit(this.repository) : super(EmployeeInitial());

  Future<void> fetchEmployees() async {
    emit(EmployeeLoading());
    try {
      final employees = await repository.fetchEmployees();
      emit(EmployeeLoaded(employees));
    } catch (e) {
      emit(EmployeeError('Failed to fetch employees: $e'));
    }
  }
}
