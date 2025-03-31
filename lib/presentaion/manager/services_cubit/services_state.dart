import 'package:equatable/equatable.dart';
import 'package:smart_solutions_application/data/models/service_model.dart';

abstract class ServicesState extends Equatable {
  const ServicesState();

  @override
  List<Object?> get props => [];
}

class ServicesInitial extends ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesSuccess extends ServicesState {
  final List<ServiceModel> services;

  const ServicesSuccess(this.services);

  @override
  List<Object?> get props => [services];
}

class ServicesFailure extends ServicesState {
  final String errorMessage;

  const ServicesFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
