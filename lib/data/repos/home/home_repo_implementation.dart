import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_solutions_application/core/api/api_service.dart';
import 'package:smart_solutions_application/core/errors/failures.dart';
import 'package:smart_solutions_application/data/models/dashboard_model.dart';
import 'package:smart_solutions_application/data/models/server_stat_model.dart';
import 'package:smart_solutions_application/data/repos/home/home_repo.dart';

class DashboardRepoImplementation extends DashboardRepo {
  @override
  Future<Either<Failure, DashboardData>> fetchDashboardData() async {
    try {
      final response = await ApiService().get('/admin/dashboard');
      final data = response.data['data'];
      final dashboardData = DashboardData.fromJson(data);
      return Right(dashboardData);
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ServerStat>>> fetchServerStats() async {
    try {
      final response = await ApiService().get('/admin/dashboard/servers-stats');
      final data = response.data['data'] as List;
      final serverStats =
          data.map((item) => ServerStat.fromJson(item)).toList();
      return Right(serverStats);
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }
}
