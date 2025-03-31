import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';

import '../../../../../../../core/utils/assets.dart';

part 'change_nav_bar_status_state.dart';

class ChangeNavBarStatusCubit extends Cubit<ChangeNavBarStatusState> {
  ChangeNavBarStatusCubit() : super(ChangeNavBarStatusInitial());

  static ChangeNavBarStatusCubit get(context) => BlocProvider.of(context);

  List<String> icons = [
    AppAssets.home100,
    AppAssets.dropHalf,
    AppAssets.chart,
    AppAssets.alignBottom,
    AppAssets.gear,
  ];
  List<String> labels = [
    AppStrings.homeTitle,
    AppStrings.homeTitle,
    AppStrings.homeTitle,
    AppStrings.homeTitle,
    AppStrings.homeTitle,
  ];



  List<String> selectedIcons = [
    AppAssets.home100,
    AppAssets.dropHalf,
    AppAssets.chart,
    AppAssets.alignBottom,
    AppAssets.gear,
  ];


  int currentIndex = 0;

  void changeNavBarIndex(int index) {
    currentIndex = index;
    emit(ChangeNavBarStatusSuccessState());
  }
}
