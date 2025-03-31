class ServerStat {
  final int id;
  final String type;
  final String status;
  final String lastRunMessage;

  ServerStat({
    required this.id,
    required this.type,
    required this.status,
    required this.lastRunMessage,
  });

  factory ServerStat.fromJson(Map<String, dynamic> json) {
    return ServerStat(
      id: json['id'],
      type: json['type'],
      status: json['status'],
      lastRunMessage: json['last_run_message'],
    );
  }
}
