import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/bg_image.dart';
import '../../home/bloc/home_bloc.dart';
import '../../home/widgets/arrow_back_button.dart';
import '../bloc/quiz_bloc.dart';
import '../models/quiz.dart';
import '../widgets/answer_card.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.level});

  final int level;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Color color1 = const Color(0xff2D034F);
  Color color2 = const Color(0xff2D034F);
  Color color3 = const Color(0xff2D034F);
  Color color4 = const Color(0xff2D034F);
  bool canTap = true;
  late Timer _timer;
  int _start = timerSec;

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            context.read<QuizBloc>().add(NextQuizEvent());
            _start = timerSec;
            changeCoins(false);
            startTimer();
          });
        } else {
          setState(() {
            _start--;
            log(_start.toString());
          });
        }
      },
    );
  }

  void setDefault(bool last) async {
    color1 = const Color(0xff2D034F);
    color2 = const Color(0xff2D034F);
    color3 = const Color(0xff2D034F);
    color4 = const Color(0xff2D034F);
    if (last) {
      context.go('/home/level/spinner');
    } else {
      canTap = true;
    }
  }

  void onTapAnswer(int id, Answer answer) async {
    if (canTap) {
      Color color = const Color(0xffB00000);
      if (answer.correct) color = const Color(0xff17930A);
      setState(() {
        if (id == 1) color1 = color;
        if (id == 2) color2 = color;
        if (id == 3) color3 = color;
        if (id == 4) color4 = color;
      });
      changeCoins(answer.correct);
      Future.delayed(const Duration(seconds: 1), () {
        _timer.cancel();
        _start = timerSec;
        context.read<QuizBloc>().add(NextQuizEvent());
        startTimer();
      });
    }
    canTap = false;
  }

  @override
  void initState() {
    super.initState();
    context.read<QuizBloc>().add(GetQuizEvent(level: widget.level));
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<QuizBloc, QuizState>(
        listener: (context, state) {
          if (state is LoadedQuizState) {
            setDefault(false);
            context.read<HomeBloc>().add(GetCoinsEvent());
          }

          if (state is FinishedQuizState) {
            setDefault(true);
          }
        },
        child: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            if (state is LoadedQuizState) {
              return Stack(
                children: [
                  const BgImage(),
                  Column(
                    children: [
                      const SizedBox(height: 58),
                      const ArrowBackButton(),
                      const SizedBox(height: 18),
                      _LevelCard(level: widget.level),
                      _QuestionCard(
                        quiz: state.quiz,
                        id: state.id,
                        sec: _start,
                      ),
                      const SizedBox(height: 70),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnswerCard(
                            id: 1,
                            answer: state.quiz.answer1.title,
                            color: color1,
                            onPressed: () {
                              onTapAnswer(1, state.quiz.answer1);
                            },
                          ),
                          const SizedBox(width: 10),
                          AnswerCard(
                            id: 2,
                            answer: state.quiz.answer2.title,
                            color: color2,
                            onPressed: () {
                              onTapAnswer(2, state.quiz.answer2);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnswerCard(
                            id: 3,
                            answer: state.quiz.answer3.title,
                            color: color3,
                            onPressed: () {
                              onTapAnswer(3, state.quiz.answer3);
                            },
                          ),
                          const SizedBox(width: 10),
                          AnswerCard(
                            id: 4,
                            answer: state.quiz.answer4.title,
                            color: color4,
                            onPressed: () {
                              onTapAnswer(4, state.quiz.answer4);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class _LevelCard extends StatelessWidget {
  const _LevelCard({required this.level});

  final int level;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 245,
      decoration: BoxDecoration(
        color: const Color(0xff2D034F),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: Text(
          'Level $level',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

class _QuestionCard extends StatelessWidget {
  const _QuestionCard({
    required this.quiz,
    required this.id,
    required this.sec,
  });

  final Quiz quiz;
  final int id;
  final int sec;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 271,
      width: 324,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xffE57EFF),
          width: 1,
        ),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff68015E),
            Color(0xffBA00E7),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '$id / 8',
                style: const TextStyle(
                  color: Color(0xffFFE500),
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Spacer(),
              Text(
                '00:${sec.toString().padLeft(2, '0')}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            quiz.question,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: quiz.question.length > 60 ? 24 : 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
