import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sensor_100_state.dart';

class Sensor100Cubit extends Cubit<Sensor100State> {
  Sensor100Cubit() : super(Sensor100Initial());

  int selectedTab=0;

  changeTabs(int index){
    selectedTab=index;
    emit(ChangeTabsSuccessState());
  }
}
