class ServiceModel {
  final int id;
  final String nameAr;
  final String nameEn;
  final String? status;
  final String? url;
  final String price; // السعر كـ String (لأنه في JSON نص)
  final int installDuration; // مدة التركيب كـ int
  final String? image;
  final int? subscribersCount;

  ServiceModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    this.status,
    this.url,
    required this.price,
    required this.installDuration,
    this.image,
    this.subscribersCount,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] ?? 0,
      nameAr: json['name_ar'] ?? 'غير معروف',
      nameEn: json['name_en'] ?? 'Unknown',
      status: json['status'],
      url: json['url'],
      price: json['price'] ?? '0', // الحفاظ على السعر كـ String
      installDuration: json['install_duration'] ?? 0, // مدة التركيب
      image: json['image'],
      subscribersCount: json['subscribers_count'] ?? 0,
    );
  }
}
