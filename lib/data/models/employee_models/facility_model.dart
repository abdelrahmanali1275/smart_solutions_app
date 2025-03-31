import 'dart:convert';

class Facility {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String address;
  final List<String> images;

  Facility({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.images,
  });

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      address: json['address'],
      images: json['images'] != null
          ? List<String>.from(jsonDecode(json['images']))
          : [],
    );
  }
}
