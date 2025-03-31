import 'package:equatable/equatable.dart';
import 'package:smart_solutions_application/data/models/activity_model.dart';

abstract class ActivityState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ActivityInitial extends ActivityState {}

class ActivityLoading extends ActivityState {}

class ActivityLoaded extends ActivityState {
  final List<Activity> activities;

  ActivityLoaded(this.activities);

  @override
  List<Object?> get props => [activities];
}

class ActivityError extends ActivityState {
  final String message;

  ActivityError(this.message);

  @override
  List<Object?> get props => [message];
}
