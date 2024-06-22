import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_test/core/utils.dart';

import '../../home/bloc/home_bloc.dart';
import '../../home/widgets/coins_count.dart';

class WinPage extends StatelessWidget {
  const WinPage({super.key, required this.coin});

  final int coin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          // Container(
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/icons/ellipse.png'),
          //       fit: BoxFit.contain,
          //     ),
          //   ),
          // ),
          // Container(
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/icons/ellipse2.png'),
          //       fit: BoxFit.fitWidth,
          //     ),
          //   ),
          // ),
          // Container(
          //   color: const Color(0xff2F0D24).withOpacity(0.7),
          // ),
          // Container(
          //   color: Colors.black.withOpacity(0.6),
          // ),
          Column(
            children: [
              Expanded(flex: 1, child: Container()),
              Image.asset(
                'assets/icons/man2.png',
                height: 180,
              ),
              SizedBox(
                height: 290,
                width: 336,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 271,
                        width: 300,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        alignment: Alignment.center,
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
                            const SizedBox(height: 46),
                            const Text(
                              'You Win:',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 54,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            CoinsCount(coin: coin),
                            const Spacer(),
                            CupertinoButton(
                              onPressed: () async {
                                await saveCoins(coin).then((value) {
                                  context.go('/home/level');
                                  context.read<HomeBloc>().add(GetCoinsEvent());
                                });
                              },
                              padding: EdgeInsets.zero,
                              child: SvgPicture.asset(
                                'assets/icons/continue_button.svg',
                              ),
                            ),
                            const SizedBox(height: 34),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 45,
                          width: 268,
                          decoration: BoxDecoration(
                            color: const Color(0xff2D034F),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Center(
                            child: Text(
                              'Congratulations!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(flex: 3, child: Container()),
            ],
          ),
        ],
      ),
    );
  }
}
