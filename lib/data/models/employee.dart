class Employee {
  final int id;
  final String name;
  final String firstName;
  final String lastName;
  final String email;
  final String? avatar; // الحقل قد يكون فارغًا
  final String phone;
  final String status;
  final City? city; // المدينة قد تكون فارغة
  final Region? region; // المنطقة قد تكون فارغة

  Employee({
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.avatar,
    required this.phone,
    required this.status,
    this.city,
    this.region,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      avatar: json['avatar'],
      phone: json['phone'],
      status: json['status'],
      city: json['city'] != null ? City.fromJson(json['city']) : null,
      region: json['region'] != null ? Region.fromJson(json['region']) : null,
    );
  }
}

class City {
  final int id;
  final String nameAr;
  final String nameEn;

  City({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
    );
  }
}

class Region {
  final int id;
  final String nameAr;
  final String nameEn;

  Region({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      id: json['id'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
    );
  }
}
