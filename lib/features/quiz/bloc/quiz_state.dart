part of 'quiz_bloc.dart';

abstract class QuizState {}

class QuizInitial extends QuizState {}

class LoadedQuizState extends QuizState {
  final Quiz quiz;
  final int id;
  LoadedQuizState({
    required this.quiz,
    required this.id,
  });
}

class FinishedQuizState extends QuizState {}
