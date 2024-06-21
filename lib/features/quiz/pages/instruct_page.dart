import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';

class InstructPage extends StatefulWidget {
  const InstructPage({super.key, required this.level});

  final int level;

  @override
  State<InstructPage> createState() => _InstructPageState();
}

class _InstructPageState extends State<InstructPage> {
  int page = 1;

  void onNext() {
    setState(() {
      page++;
    });
  }

  void onStart() {
    context.go('/home/level/quiz', extra: widget.level);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/splash.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Text(
                '$page / 3',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 33),
              Row(
                children: [
                  const Spacer(),
                  if (page == 1) SvgPicture.asset('assets/icons/instruct1.svg'),
                  if (page == 2) SvgPicture.asset('assets/icons/instruct2.svg'),
                  if (page == 3) SvgPicture.asset('assets/icons/instruct3.svg'),
                  const SizedBox(width: 33),
                ],
              ),
              Expanded(
                flex: 4,
                child: Container(),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Image.asset(
              'assets/icons/man.png',
              height: 600,
            ),
          ),
          Column(
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _SkipButton(onPressed: onStart),
                  _NextButton(
                    start: page == 3,
                    onNext: onNext,
                    onStart: onStart,
                  ),
                ],
              ),
              const SizedBox(height: 65),
            ],
          ),
        ],
      ),
    );
  }
}

class _SkipButton extends StatelessWidget {
  const _SkipButton({required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: AppColors.purple,
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Container(
          height: 60,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: const Color(0xff2F0D24),
          ),
          child: const Center(
            child: Text(
              'Skip',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({
    this.start = false,
    required this.onNext,
    required this.onStart,
  });

  final bool start;
  final void Function() onNext;
  final void Function() onStart;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 168,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: AppColors.purple,
      ),
      child: CupertinoButton(
        onPressed: start ? onStart : onNext,
        padding: EdgeInsets.zero,
        child: SvgPicture.asset(
          start
              ? 'assets/icons/start_button.svg'
              : 'assets/icons/next_button.svg',
        ),
      ),
    );
  }
}
