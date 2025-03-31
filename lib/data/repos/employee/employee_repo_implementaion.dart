import 'package:dio/dio.dart';
import 'package:smart_solutions_application/core/api/api_service.dart';
import 'package:smart_solutions_application/data/models/employee.dart';
import 'package:smart_solutions_application/data/models/employee_models/employee_model.dart';
import 'package:smart_solutions_application/data/repos/employee/employee_repo.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final ApiService _apiService = ApiService();

  EmployeeRepositoryImpl();

  @override
  Future<List<Employee>> fetchEmployees() async {
    try {
      final response = await _apiService.get('/client/employees');
      print('API Response: ${response.data}');

      if (response.statusCode == 200) {
        final List data = response.data['data'];
        return data.map((json) => Employee.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch employees');
      }
    } catch (e) {
      throw Exception('Error occurred while fetching employees: $e');
    }
  }
}
