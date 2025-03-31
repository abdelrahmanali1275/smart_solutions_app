import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_solutions_application/core/api/api_service.dart';
import 'package:smart_solutions_application/data/repos/owners/owners_repo_implementation.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(
    ApiService(),
  );
  getIt.registerSingleton<OwnersRepoImplementation>(
    OwnersRepoImplementation(),
  );
}
