import 'package:equatable/equatable.dart';
import 'package:smart_solutions_application/data/models/facility_model.dart';

abstract class FacilityState extends Equatable {
  const FacilityState();

  @override
  List<Object?> get props => [];
}

class FacilityInitial extends FacilityState {}

class FacilityLoading extends FacilityState {}

class FacilityFailure extends FacilityState {
  final String errorMessage;
  const FacilityFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class FacilitySuccess extends FacilityState {
  final List<FacilityModel> facilities;
  const FacilitySuccess(this.facilities);

  @override
  List<Object?> get props => [facilities];
}
