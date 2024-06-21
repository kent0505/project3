import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/quiz.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  int id = 0;
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
      log('LoadedQuizState');
      emit(LoadedQuizState(quiz: sortedQuizes[id]));
    });

    on<NextQuizEvent>((event, emit) {
      id = id + 1;
      if (id <= 7) {
        log('LoadedQuizState');
        emit(LoadedQuizState(quiz: sortedQuizes[id]));
      }

      if (id == 8) {
        log('FinishedQuizState');
        emit(FinishedQuizState());
      }
    });
  }
}
