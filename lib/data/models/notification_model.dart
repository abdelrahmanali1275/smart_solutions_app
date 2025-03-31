class NotificationModel {
  final String id;
  final String message;
  final String createdAt;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.message,
    required this.createdAt,
    this.isRead = false,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      message: json['data']['message'],
      createdAt: json['created_at'],
      isRead: json['read_at'] != null,
    );
  }
}
