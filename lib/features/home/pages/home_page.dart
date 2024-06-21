import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../widgets/coins_count.dart';
import '../widgets/menu_button.dart';
import '../widgets/play_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/menu.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 20,
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset('assets/icons/logo.svg'),
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
          Positioned(
            bottom: 78,
            right: 0,
            left: 0,
            child: Column(
              children: [
                const Row(
                  children: [
                    Spacer(),
                    CoinsCount(),
                    SizedBox(width: 34),
                  ],
                ),
                const SizedBox(height: 208),
                PlayButton(
                  onPressed: () {
                    context.push('/home/level');
                  },
                ),
                const SizedBox(height: 20),
                MenuButton(
                  onPressed: () {
                    context.push('/shop');
                  },
                ),
                const SizedBox(height: 20),
                MenuButton(
                  rules: true,
                  onPressed: () {
                    context.push('/rules');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
