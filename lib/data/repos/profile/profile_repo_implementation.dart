import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_solutions_application/core/api/api_service.dart';
import 'package:smart_solutions_application/core/errors/failures.dart';
import 'package:smart_solutions_application/data/models/admin_profile_model.dart';
import 'package:smart_solutions_application/data/repos/profile/profile_repo.dart';

class ProfileRepoImplementation extends ProfileRepo {
  @override
  Future<Either<Failure, AdminProfileModel>> fetchProfile() async {
    try {
      final response = await ApiService().get('/admin/user');
      final data = response.data['data'];

      final user = AdminProfileModel.fromJson(data);

      return Right(user);
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }
}
