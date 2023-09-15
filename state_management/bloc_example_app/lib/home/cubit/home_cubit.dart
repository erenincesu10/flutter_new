import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(HomeState(
          status: HomeStatus.init,
          counter: 0,
        ));

  void incrementCounter() {
    emit(state.copyWith(status: HomeStatus.loading));
    var counter = state.counter;
    counter++;
    //emit değişkenin statenin değişmesini sağlar
    emit(state.copyWith(counter: counter));
    if (counter > 20) {
      emit(state.copyWith(status: HomeStatus.error));
    } else {
      emit(state.copyWith(status: HomeStatus.success));
    }
  }
}
