import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/bg_image.dart';
import '../../quiz/bloc/quiz_bloc.dart';
import '../widgets/arrow_back_button.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BgImage(),
          // Image.asset(
          //   'assets/icons/bg1.png',
          //   fit: BoxFit.cover,
          // ),
          Column(
            children: [
              const SizedBox(height: 58),
              const ArrowBackButton(),
              const SizedBox(height: 27),
              Container(
                height: 45,
                width: 174,
                decoration: BoxDecoration(
                  color: const Color(0xff2D034F),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Center(
                  child: Text(
                    'Levels',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              BlocBuilder<QuizBloc, QuizState>(
                builder: (context, state) {
                  return Wrap(
                    runSpacing: 15,
                    spacing: 15,
                    children: [
                      _LevelButton(
                        level: 1,
                        price: 100,
                        current: getCurrent(1),
                      ),
                      _LevelButton(
                        level: 2,
                        price: 200,
                        locked: getLocked(2),
                        current: getCurrent(2),
                      ),
                      _LevelButton(
                        level: 3,
                        price: 250,
                        locked: getLocked(3),
                        current: getCurrent(3),
                      ),
                      _LevelButton(
                        level: 4,
                        price: 300,
                        locked: getLocked(4),
                        current: getCurrent(4),
                      ),
                      _LevelButton(
                        level: 5,
                        price: 350,
                        locked: getLocked(5),
                        current: getCurrent(5),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LevelButton extends StatelessWidget {
  const _LevelButton({
    required this.level,
    required this.price,
    this.locked = false,
    required this.current,
  });

  final int level;
  final int price;
  final bool locked;
  final bool current;

  @override
  Widget build(BuildContext context) {
    return locked
        ? SizedBox(
            height: 125,
            width: 108,
            child: Column(
              children: [
                const SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(41),
                  ),
                  child: SizedBox(
                    height: 82,
                    width: 82,
                    child: Stack(
                      children: [
                        SvgPicture.asset('assets/icons/level_button.svg'),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '$level',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              SvgPicture.asset('assets/icons/lock.svg'),
                              const SizedBox(height: 3),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                SvgPicture.asset('assets/icons/${price}coins.svg')
              ],
            ),
          )
        : SizedBox(
            height: 125,
            width: 108,
            child: Column(
              children: [
                Container(
                  height: 108,
                  width: 108,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(54),
                    boxShadow: current
                        ? const [
                            BoxShadow(
                              color: Color(0xffFF00F5),
                              blurRadius: 15,
                            ),
                          ]
                        : [],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(41),
                    ),
                    child: CupertinoButton(
                      onPressed: () {
                        context.push('/instruct', extra: level);
                      },
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        height: 82,
                        width: 82,
                        child: Stack(
                          children: [
                            SvgPicture.asset('assets/icons/level_button.svg'),
                            Center(
                              child: Text(
                                '$level',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
