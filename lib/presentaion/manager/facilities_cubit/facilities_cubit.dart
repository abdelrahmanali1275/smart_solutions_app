import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_solutions_application/data/repos/facilities/facilities_repo.dart';
import 'package:smart_solutions_application/presentaion/manager/facilities_cubit/facilities_state.dart';

class FacilitiesCubit extends Cubit<FacilityState> {
  final FacilitiesRepo facilitiesRepo;

  FacilitiesCubit(this.facilitiesRepo) : super(FacilityInitial());

  Future<void> fetchFacility() async {
    emit(FacilityLoading());

    try {
      final result = await facilitiesRepo.fetchFacility();

      result.fold(
        (failure) {
          print('Failure: ${failure.errorMessage}');
          emit(FacilityFailure(failure.errorMessage));
        },
        (facilities) {
          print('Success: Fetched ${facilities.length} facilities');
          emit(FacilitySuccess(facilities));
        },
      );
    } catch (e) {
      print('Unexpected Error: $e');
      emit(FacilityFailure('Unexpected error occurred'));
    }
  }
}
