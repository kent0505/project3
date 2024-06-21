part of 'quiz_bloc.dart';

abstract class QuizEvent {}

class GetQuizEvent extends QuizEvent {
  final int level;
  GetQuizEvent({required this.level});
}

class CheckAnswerEvent extends QuizEvent {
  final Answer answer;
  CheckAnswerEvent({required this.answer});
}

class NextQuizEvent extends QuizEvent {}
