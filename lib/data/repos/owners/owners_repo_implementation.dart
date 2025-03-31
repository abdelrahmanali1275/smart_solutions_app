import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_solutions_application/core/api/api_service.dart';
import 'package:smart_solutions_application/core/errors/failures.dart';
import 'package:smart_solutions_application/data/models/owners_model/owners_model.dart';
import 'package:smart_solutions_application/data/repos/owners/owners_repo.dart';

class OwnersRepoImplementation extends OwnersRepo {
  @override
  Future<Either<Failure, List<OwnersModel>>> fetchOwners() async {
    try {
      var response = await ApiService().get(
        '/admin/owners',
      );
      print('Response data: ${response.data}');

      // تحقق من نوع البيانات
      if (response.data['data'] is! List) {
        throw Exception(
            "Expected a List in response.data, but got ${response.data.runtimeType}");
      }

      // تحويل البيانات إلى قائمة من OwnersModel
      List<OwnersModel> owners = (response.data['data'] as List<dynamic>)
          .map((item) => OwnersModel.fromJson(item as Map<String, dynamic>))
          .toList();

      return right(owners);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
