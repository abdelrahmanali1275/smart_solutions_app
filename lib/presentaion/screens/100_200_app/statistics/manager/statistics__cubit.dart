import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'statistics__state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit() : super(StatisticsInitial());

  int selectedTab=0;

  changeTabs(int index){
    selectedTab=index;
    emit(ChangeTabsSuccessState());
  }
}
