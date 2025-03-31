import 'package:smart_solutions_application/data/models/service_model.dart';

class ServicePageModel {
  final int currentPage;
  final List<ServiceModel> data;
  final String? firstPageUrl;
  final int lastPage;
  final String? lastPageUrl;
  final List<PageLink> links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  ServicePageModel({
    required this.currentPage,
    required this.data,
    this.firstPageUrl,
    required this.lastPage,
    this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory ServicePageModel.fromJson(Map<String, dynamic> json) {
    return ServicePageModel(
      currentPage: json['current_page'],
      data: (json['data'] as List<dynamic>)
          .map((item) => ServiceModel.fromJson(item))
          .toList(),
      firstPageUrl: json['first_page_url'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: (json['links'] as List<dynamic>)
          .map((link) => PageLink.fromJson(link))
          .toList(),
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class PageLink {
  final String? url;
  final String label;
  final bool active;

  PageLink({
    this.url,
    required this.label,
    required this.active,
  });

  factory PageLink.fromJson(Map<String, dynamic> json) {
    return PageLink(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }
}
