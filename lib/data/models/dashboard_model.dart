class DashboardData {
  final int ownersCount;
  final int ownersWithSubscriptionsCount;
  final int servicesCount;
  final int facilitiesCount;

  DashboardData({
    required this.ownersCount,
    required this.ownersWithSubscriptionsCount,
    required this.servicesCount,
    required this.facilitiesCount,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) {
    return DashboardData(
      ownersCount: json['owners_count'],
      ownersWithSubscriptionsCount: json['owners_with_subscriptions_count'],
      servicesCount: json['services_count'],
      facilitiesCount: json['facilities_count'],
    );
  }
}
