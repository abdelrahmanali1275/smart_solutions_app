import 'package:equatable/equatable.dart';

class Region extends Equatable {
  final int? id;
  final String? nameAr;
  final String? nameEn;
  final String? userName;
  final int? cityId;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  const Region({
    this.id,
    this.nameAr,
    this.nameEn,
    this.userName,
    this.cityId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        id: json['id'] as int?,
        nameAr: json['name_ar'] as String?,
        nameEn: json['name_en'] as String?,
        userName: json['user_name'] as String?,
        cityId: json['city_id'] as int?,
        status: json['status'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        deletedAt: json['deleted_at'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name_ar': nameAr,
        'name_en': nameEn,
        'user_name': userName,
        'city_id': cityId,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
      };

  @override
  List<Object?> get props {
    return [
      id,
      nameAr,
      nameEn,
      userName,
      cityId,
      status,
      createdAt,
      updatedAt,
      deletedAt,
    ];
  }
}
