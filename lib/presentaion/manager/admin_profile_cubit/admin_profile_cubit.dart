import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_solutions_application/data/models/admin_profile_model.dart';
import 'package:smart_solutions_application/data/repos/profile/profile_repo.dart';
import 'package:smart_solutions_application/presentaion/manager/admin_profile_cubit/admin_profile_state.dart';

class UserFailure extends AdminProfileState {
  final String errorMessage;
  UserFailure(this.errorMessage);
}

class AdminProfileCubit extends Cubit<AdminProfileState> {
  final ProfileRepo _repo;

  AdminProfileCubit(this._repo) : super(AdminProfileInitial());

  Future<void> fetchUser() async {
    emit(AdminProfileLoading());
    final result = await _repo.fetchProfile();
    result.fold(
      (failure) => emit(UserFailure(failure.errorMessage)),
      (user) => emit(AdminProfileSuccess(user)),
    );
  }
}
