import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_solutions_application/core/api/api_service.dart';
import 'package:smart_solutions_application/core/errors/failures.dart';
import 'package:smart_solutions_application/data/models/facility_model.dart';
import 'package:smart_solutions_application/data/repos/facilities/facilities_repo.dart';

class FacilitiesRepoImplementation extends FacilitiesRepo {
  final ApiService _apiService = ApiService();

  @override
  Future<Either<Failure, List<FacilityModel>>> fetchFacility() async {
    try {
      // إجراء طلب إلى API
      final response = await _apiService.get('/admin/facilities');
      print('API Response: ${response.data}');

      // تحويل البيانات إلى قائمة من FacilityModel
      final facilities = (response.data['data'] as List)
          .map((facility) => FacilityModel.fromJson(facility))
          .toList();

      return Right(facilities);
    } on DioException catch (e) {
      // التعامل مع أخطاء Dio
      print('Dio Error: ${e.response?.data}');
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      // التعامل مع أي أخطاء أخرى
      print('Error in API Request: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> fetchFacilityDetails(
      int facilityId) async {
    try {
      final response = await _apiService.get('/admin/facilities/$facilityId');
      return Right(response.data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
