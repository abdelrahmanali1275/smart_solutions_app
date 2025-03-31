import 'package:dartz/dartz.dart';
import 'package:smart_solutions_application/core/errors/failures.dart';
import 'package:smart_solutions_application/data/models/dashboard_model.dart';
import 'package:smart_solutions_application/data/models/server_stat_model.dart';

abstract class DashboardRepo {
  Future<Either<Failure, DashboardData>> fetchDashboardData();
  Future<Either<Failure, List<ServerStat>>> fetchServerStats();
}
