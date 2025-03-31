import 'package:dartz/dartz.dart';
import 'package:smart_solutions_application/core/errors/failures.dart';
import 'package:smart_solutions_application/data/models/facility_model.dart';

abstract class FacilitiesRepo {
  Future<Either<Failure, List<FacilityModel>>> fetchFacility();
  Future<Either<Failure, Map<String, dynamic>>> fetchFacilityDetails(
      int facilityId);
}
