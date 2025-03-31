import 'package:smart_solutions_application/data/models/service_model.dart';

class FacilityModel {
  final int id;
  final String name;
  final String? address;
  final String? status;
  final String? phone;
  final String? email;
  final List<String>? images;
  final String? ownerName;
  final String? cityName;
  final String? regionName;
  final List<ServiceModel>? services;

  FacilityModel({
    required this.id,
    required this.name,
    this.address,
    this.status,
    this.phone,
    this.email,
    this.images,
    this.ownerName,
    this.cityName,
    this.regionName,
    this.services,
  });

  factory FacilityModel.fromJson(Map<String, dynamic> json) {
    return FacilityModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'غير معروف',
      address: json['address'] as String?,
      status: json['status'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((image) => image.toString())
          .toList(),
      ownerName: json['owner']?['name'] as String? ?? 'غير معروف',
      cityName: json['city']?['name_ar'] as String? ?? 'غير معروف',
      regionName: json['region']?['name_ar'] as String? ?? 'غير معروف',
      services: (json['services'] as List<dynamic>?)
          ?.map((service) => ServiceModel.fromJson(service))
          .toList(),
    );
  }
}
