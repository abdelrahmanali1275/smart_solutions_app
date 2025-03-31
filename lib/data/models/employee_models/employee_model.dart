import 'package:smart_solutions_application/data/models/employee_models/facility_model.dart';

class EmployeeModel {
  final int id;
  final String name;
  final String firstName;
  final String lastName;
  final String email;
  final int? regionId;
  final String? region;
  final String? city;
  final int? cityId;
  final String? address;
  final String avatar;
  final String empId;
  final String phone;
  final String status;
  final String role;
  final Facility? facility;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.regionId,
    this.region,
    this.city,
    this.cityId,
    this.address,
    required this.avatar,
    required this.empId,
    required this.phone,
    required this.status,
    required this.role,
    this.facility,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      name: json['name'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      regionId: json['region_id'],
      region: json['region'],
      city: json['city'],
      cityId: json['city_id'],
      address: json['address'],
      avatar: json['avatar'],
      empId: json['emp_id'],
      phone: json['phone'],
      status: json['status'],
      role: json['role'],
      facility:
          json['facility'] != null ? Facility.fromJson(json['facility']) : null,
    );
  }
}
