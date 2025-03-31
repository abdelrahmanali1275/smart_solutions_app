import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_solutions_application/data/repos/facilities/facilities_repo.dart';
import 'package:smart_solutions_application/presentaion/manager/facility_details_cubit/facility_details_state.dart';

class FacilityDetailsCubit extends Cubit<FacilityDetailsState> {
  FacilityDetailsCubit(this.facilitiesRepo) : super(FacilityDetailsInitial());

  final FacilitiesRepo facilitiesRepo;

  Future<void> fetchFacilityDetails(int facilityId) async {
    emit(FacilityDetailsLoading());
    var result = await facilitiesRepo.fetchFacilityDetails(facilityId);
    result.fold(
        (failure) => {
              print('Failure: ${failure.errorMessage}'),
              emit(FacilityDetailsFailure(failure.errorMessage)),
            }, (facilityDetails) {
      print('Facility details fetched: $facilityDetails');

      emit(FacilityDetailsSuccess(facilityDetails));
    });
  }
}
