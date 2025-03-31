import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_solutions_application/data/repos/owners/owners_repo.dart';
import 'package:smart_solutions_application/presentaion/manager/owners_cubit/owners_state.dart';

class OwnersCubit extends Cubit<OwnersState> {
  OwnersCubit(this.ownersRepo) : super(OwnersInitial());

  final OwnersRepo ownersRepo;
  Future<void> featchOwners() async {
    emit(OwnersLoading());
    var result = await ownersRepo.fetchOwners();
    result.fold(
        (failure) => {
              print('Failure: ${failure.errorMessage}'),
              emit(
                OwnersFailure(failure.errorMessage),
              ),
            }, (owners) {

      emit(
        OwnersSuccess(owners),
      );
    });
  }
}
