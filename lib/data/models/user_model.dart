class UserModel {
  final int id;
  final String name;
  final String firstName;
  final String lastName;
  final String email;
  final String? avatar;
  final String phone;
  final String status;
  final String role;
  final int? countFacilities;
  final int? countEmployees;
  final String? address;

  UserModel(
      {required this.id,
      required this.name,
      required this.firstName,
      required this.lastName,
      required this.email,
      this.avatar,
      required this.phone,
      required this.status,
      required this.role,
      this.countFacilities,
      this.countEmployees,
      this.address});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        avatar: json['avatar'],
        phone: json['phone'],
        status: json['status'],
        role: json['role'],
        countFacilities: json['count_facilities'] ?? 0,
        countEmployees: json['count_employees'] ?? 0,
        address: json['address']);
  }
}
