part of 'quiz_bloc.dart';

abstract class QuizState {}

class QuizInitial extends QuizState {}

class LoadedQuizState extends QuizState {
  final Quiz quiz;
  LoadedQuizState({required this.quiz});
}

class FinishedQuizState extends QuizState {}
