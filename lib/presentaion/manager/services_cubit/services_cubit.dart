import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_solutions_application/data/repos/services/services_repo.dart';
import 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final ServicesRepo servicesRepo;

  ServicesCubit(this.servicesRepo) : super(ServicesInitial());

  Future<void> fetchServices() async {
    emit(ServicesLoading());

    try {
      final result = await servicesRepo.fetchServices();

      result.fold(
        (failure) {
          emit(ServicesFailure(failure.errorMessage));
        },
        (services) {
          emit(ServicesSuccess(services));
        },
      );
    } catch (e) {
      emit(ServicesFailure('Unexpected error occurred'));
    }
  }
}
