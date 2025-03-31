import 'package:dartz/dartz.dart';
import 'package:smart_solutions_application/core/errors/failures.dart';
import 'package:smart_solutions_application/data/models/owners_model/owners_model.dart';

abstract class OwnersRepo {
  Future<Either<Failure, List<OwnersModel>>> fetchOwners();
}
