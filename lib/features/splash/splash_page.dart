import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool loaded = false;

  void _init() async {
    await getData().then(
      (value) {
        Future.delayed(const Duration(seconds: 2), () {
          context.go('/home');
        });
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() => loaded = true);
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                Container(
                  height: 292,
                  margin: const EdgeInsets.symmetric(horizontal: 26),
                  alignment: Alignment.center,
                  child: SvgPicture.asset('assets/icons/logo.svg'),
                ),
                const SizedBox(height: 70),
                const Text(
                  'Loading...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 15),
                Stack(
                  children: [
                    Container(
                      height: 8,
                      width: 186,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: 4,
                      margin: const EdgeInsets.all(2),
                      width: loaded ? 182 : 0,
                      decoration: BoxDecoration(
                        color: AppColors.loading,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 3,
                  child: Container(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
