import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_solutions_application/core/api/api_service.dart';
import 'package:smart_solutions_application/core/errors/failures.dart';
import 'package:smart_solutions_application/data/models/admin_profile_model.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/drawer_screens/admin_profile.dart';

abstract class ProfileRepo {
  Future<Either<Failure, AdminProfileModel>> fetchProfile();
}
