import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetCoinsEvent>((event, emit) {
      emit(HomeLoadedState(coins: coins));
    });
  }
}
