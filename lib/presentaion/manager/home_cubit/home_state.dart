import 'package:smart_solutions_application/data/models/dashboard_model.dart';
import 'package:smart_solutions_application/data/models/server_stat_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final DashboardData dashboardData;
  final List<ServerStat> serverStats;

  HomeSuccess(this.dashboardData, this.serverStats);
}

class HomeFailure extends HomeState {
  final String errorMessage;

  HomeFailure(this.errorMessage);
}
