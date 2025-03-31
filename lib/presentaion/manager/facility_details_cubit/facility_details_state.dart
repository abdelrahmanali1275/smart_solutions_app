import 'package:equatable/equatable.dart';

abstract class FacilityDetailsState extends Equatable {
  const FacilityDetailsState();

  @override
  List<Object?> get props => [];
}

class FacilityDetailsInitial extends FacilityDetailsState {}

class FacilityDetailsLoading extends FacilityDetailsState {}

class FacilityDetailsFailure extends FacilityDetailsState {
  final String errorMessage;
  const FacilityDetailsFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class FacilityDetailsSuccess extends FacilityDetailsState {
  final Map<String, dynamic> facilityDetails;
  const FacilityDetailsSuccess(this.facilityDetails);

  @override
  List<Object?> get props => [facilityDetails];
}
