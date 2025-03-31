import 'package:equatable/equatable.dart';

class City extends Equatable {
  final int? id;
  final String? nameAr;
  final String? nameEn;
  final String? userName;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic postalCode;

  const City({
    this.id,
    this.nameAr,
    this.nameEn,
    this.userName,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.postalCode,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json['id'] as int?,
        nameAr: json['name_ar'] as String?,
        nameEn: json['name_en'] as String?,
        userName: json['user_name'] as String?,
        status: json['status'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        postalCode: json['postal_code'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name_ar': nameAr,
        'name_en': nameEn,
        'user_name': userName,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'postal_code': postalCode,
      };

  @override
  List<Object?> get props {
    return [
      id,
      nameAr,
      nameEn,
      userName,
      status,
      createdAt,
      updatedAt,
      postalCode,
    ];
  }
}
