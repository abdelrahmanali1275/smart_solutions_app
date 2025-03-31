import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_solutions_application/core/api/api_service.dart';
import 'package:smart_solutions_application/core/errors/failures.dart';
import 'package:smart_solutions_application/data/models/service_model.dart';
import 'package:smart_solutions_application/data/repos/services/services_repo.dart';

class ServicesRepoImplementation extends ServicesRepo {
  final ApiService _apiService = ApiService();

  Future<Either<Failure, List<ServiceModel>>> fetchServices() async {
    try {
      final response = await _apiService.get('/client/services/subcribed');
      print('API Response: ${response.data}');

      // استخراج الخدمات وتحويلها إلى قائمة
      final services = (response.data['data'] as List)
          .map((service) => ServiceModel.fromJson(service))
          .toList();

      return Right(services);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
