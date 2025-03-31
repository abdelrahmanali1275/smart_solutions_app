import 'package:dio/dio.dart';
import 'package:smart_solutions_application/data/models/employee.dart';
import 'package:smart_solutions_application/data/models/employee_models/employee_model.dart';

abstract class EmployeeRepository {
  Future<List<Employee>> fetchEmployees();
}
