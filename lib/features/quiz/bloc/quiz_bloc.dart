import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/core/utils.dart';

import '../models/quiz.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  int id = 0;
  int coinsState = coins;
  List<Quiz> sortedQuizes = [];

  QuizBloc() : super(QuizInitial()) {
    on<GetQuizEvent>((event, emit) {
      id = 0;
      sortedQuizes = [];
      for (Quiz quiz in quizes) {
        if (quiz.level == event.level) {
          sortedQuizes.add(quiz);
        }
      }
      sortedQuizes.shuffle();
      emit(LoadedQuizState(quiz: sortedQuizes[id], id: id + 1));
    });

    on<NextQuizEvent>((event, emit) {
      id = id + 1;
      if (id <= 7) emit(LoadedQuizState(quiz: sortedQuizes[id], id: id + 1));
      if (id == 8) emit(FinishedQuizState());
    });
  }
}
