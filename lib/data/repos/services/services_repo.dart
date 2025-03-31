import 'package:dartz/dartz.dart';
import 'package:smart_solutions_application/core/errors/failures.dart';
import 'package:smart_solutions_application/data/models/service_model.dart';

abstract class ServicesRepo {
  Future<Either<Failure, List<ServiceModel>>> fetchServices();
}
