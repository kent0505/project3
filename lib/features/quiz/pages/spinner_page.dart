import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../home/widgets/arrow_back_button.dart';

class SpinnerPage extends StatefulWidget {
  const SpinnerPage({super.key});

  @override
  State<SpinnerPage> createState() => _SpinnerPageState();
}

class _SpinnerPageState extends State<SpinnerPage> {
  double turns = 0.0;
  double angle = 0;
  bool active = true;

  List<double> angles = [
    2, // 15
    4, // 5
    14, // 10
    16, // 20
    20, // 1
  ];

  int getCoins() {
    if (angle == 2) {
      return 15;
    } else if (angle == 4) {
      return 5;
    } else if (angle == 14) {
      return 10;
    } else if (angle == 16) {
      return 20;
    } else {
      return 1;
    }
  }

  void onSpin() {
    setState(() {
      active = false;
      turns += 5 / 1;
    });
    getRandom();
    Future.delayed(const Duration(seconds: 7), () {
      context.go('/home/level/win', extra: getCoins());
    });
  }

  void getRandom() {
    Random random = Random();
    int randomIndex = random.nextInt(angles.length);
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        angle = angles[randomIndex];
        print(angle);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple,
      body: Stack(
        children: [
          Container(
            color: const Color(0xff2F0D24).withOpacity(0.7),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/ellipse.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/ellipse2.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          Column(
            children: [
              const SizedBox(height: 58),
              const ArrowBackButton(),
              const SizedBox(height: 10),
              SizedBox(
                width: 370,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/man2.png',
                      height: 260,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 127,
            right: 25,
            child: SvgPicture.asset('assets/icons/spinner_text.svg'),
          ),
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: Transform.rotate(
              angle: angle,
              child: AnimatedRotation(
                duration: const Duration(seconds: 6),
                curve: Curves.easeInOutCirc,
                turns: turns,
                child: SvgPicture.asset('assets/icons/spinner.svg'),
              ),
            ),
          ),
          Positioned(
            top: 285,
            left: 0,
            right: 0,
            child: SvgPicture.asset('assets/icons/selector.svg'),
          ),
          Positioned(
            bottom: 86,
            left: 0,
            right: 0,
            child: active
                ? CupertinoButton(
                    onPressed: onSpin,
                    padding: EdgeInsets.zero,
                    child: SvgPicture.asset('assets/icons/spin_button.svg'),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
