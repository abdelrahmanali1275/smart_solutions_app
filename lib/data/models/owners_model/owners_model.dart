import 'package:equatable/equatable.dart';

import 'city.dart';
import 'region.dart';

class OwnersModel extends Equatable {
  final int? id;
  final String? name;
  final String? firstName;
  final String? userType;
  final String? lastName;
  final String? email;
  final Region? region;
  final City? city;
  final dynamic address;
  final String? avatar;
  final dynamic empId;
  final String? phone;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? facilities;

  const OwnersModel({
    this.id,
    this.name,
    this.firstName,
    this.userType,
    this.lastName,
    this.email,
    this.region,
    this.city,
    this.address,
    this.avatar,
    this.empId,
    this.phone,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.facilities,
  });

  factory OwnersModel.fromJson(Map<String, dynamic> json) => OwnersModel(
        id: json['id'] is int
            ? json['id']
            : int.tryParse(json['id']?.toString() ?? ''),
        name: json['name'] as String?,
        firstName: json['first_name'] as String?,
        userType: json['user_type'] as String?,
        lastName: json['last_name'] as String?,
        email: json['email'] as String?,
        region: json['region'] != null ? Region.fromJson(json['region']) : null,
        city: json['city'] != null ? City.fromJson(json['city']) : null,
        address: json['address'],
        avatar: json['avatar'] as String?,
        empId: json['emp_id'],
        phone: json['phone'] as String?,
        status: json['status'] as String?,
        createdAt: json['created_at'] != null
            ? DateTime.tryParse(json['created_at'])
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.tryParse(json['updated_at'])
            : null,
        facilities: json['facilities'] != null
            ? List<dynamic>.from(json['facilities'])
            : [],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'first_name': firstName,
        'user_type': userType,
        'last_name': lastName,
        'email': email,
        'region': region?.toJson(),
        'city': city?.toJson(),
        'address': address,
        'avatar': avatar,
        'emp_id': empId,
        'phone': phone,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'facilities': facilities,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      firstName,
      userType,
      lastName,
      email,
      region,
      city,
      address,
      avatar,
      empId,
      phone,
      status,
      createdAt,
      updatedAt,
      facilities,
    ];
  }
}
