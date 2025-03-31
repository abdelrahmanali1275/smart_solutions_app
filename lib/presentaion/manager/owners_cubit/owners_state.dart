import 'package:equatable/equatable.dart';
import 'package:smart_solutions_application/data/models/owners_model/owners_model.dart';

abstract class OwnersState extends Equatable {
  const OwnersState();

  @override
  List<Object> get props => [];
}

class OwnersInitial extends OwnersState {}

class OwnersLoading extends OwnersState {}

class OwnersFailure extends OwnersState {
  final String errorMessage;
  const OwnersFailure(this.errorMessage);
}

class OwnersSuccess extends OwnersState {
  final List<OwnersModel> owners;
  const OwnersSuccess(this.owners);
}
