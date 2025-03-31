class Activity {
  final int id;
  final String logName;
  final String description;
  final String subjectType;
  final String event;
  final String createdAt;
  final String updatedAt;

  Activity({
    required this.id,
    required this.logName,
    required this.description,
    required this.subjectType,
    required this.event,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'],
      logName: json['log_name'],
      description: json['description'],
      subjectType: json['subject_type'],
      event: json['event'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
