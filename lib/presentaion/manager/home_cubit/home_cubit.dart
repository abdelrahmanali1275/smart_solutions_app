import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_solutions_application/data/repos/home/home_repo.dart';
import 'package:smart_solutions_application/presentaion/manager/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final DashboardRepo _dashboardRepo;

  HomeCubit(this._dashboardRepo) : super(HomeInitial());

  Future<void> fetchHomeData() async {
    emit(HomeLoading());
    final dashboardResult = await _dashboardRepo.fetchDashboardData();
    final serverStatsResult = await _dashboardRepo.fetchServerStats();

    dashboardResult.fold(
      (failure) => emit(HomeFailure(failure.errorMessage)),
      (dashboardData) {
        serverStatsResult.fold(
          (failure) => emit(HomeFailure(failure.errorMessage)),
          (serverStats) {
            emit(HomeSuccess(dashboardData, serverStats));
          },
        );
      },
    );
  }
}
