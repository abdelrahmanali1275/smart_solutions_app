import 'package:smart_solutions_application/data/models/admin_profile_model.dart';

abstract class AdminProfileState {
  get errorMessage => null;
}

class AdminProfileInitial extends AdminProfileState {}

class AdminProfileLoading extends AdminProfileState {}

class AdminProfileSuccess extends AdminProfileState {
  final AdminProfileModel user;
  AdminProfileSuccess(this.user);
}

class AdminProfileError extends AdminProfileState {
  final String errorMessage;
  AdminProfileError(this.errorMessage);
}
