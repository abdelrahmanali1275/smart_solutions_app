class AdminProfileModel {
  final int id;
  final String name;
  final String email;
  final String? city;
  final String? region;
  final String? address;
  final String phone;
  final String status;
  final String? avatar;

  AdminProfileModel({
    required this.id,
    required this.name,
    required this.email,
    this.city,
    this.region,
    this.address,
    required this.phone,
    required this.status,
    this.avatar,
  });

  factory AdminProfileModel.fromJson(Map<String, dynamic> json) {
    return AdminProfileModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      city: json['city'],
      region: json['region'],
      address: json['address'],
      phone: json['phone'],
      status: json['status'],
      avatar: json['avatar'],
    );
  }
}
