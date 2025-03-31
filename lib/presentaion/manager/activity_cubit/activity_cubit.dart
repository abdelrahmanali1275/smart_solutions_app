import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_solutions_application/data/repos/activity/activity_repo_implementation.dart';
import 'activity_state.dart';

class ActivityCubit extends Cubit<ActivityState> {
  final ActivityRepoImplementation _repository;

  ActivityCubit(this._repository) : super(ActivityInitial());

  void fetchActivities() async {
    emit(ActivityLoading());
    try {
      final activities = await _repository.fetchActivities();
      emit(ActivityLoaded(activities));
    } catch (e) {
      emit(ActivityError('Failed to load activities: $e'));
    }
  }
}
