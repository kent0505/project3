import 'package:go_router/go_router.dart';
import 'package:quiz_test/features/quiz/pages/spinner_page.dart';
import 'package:quiz_test/features/quiz/pages/win_page.dart';

import '../../features/home/pages/level_page.dart';
import '../../features/home/pages/rules_page.dart';
import '../../features/shop/pages/shop_page.dart';
import '../../features/quiz/pages/instruct_page.dart';
import '../../features/quiz/pages/quiz_page.dart';
import '../../features/splash/splash_page.dart';
import '../../features/home/pages/home_page.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'level',
          builder: (context, state) => const LevelPage(),
          routes: [
            GoRoute(
              path: 'quiz',
              builder: (context, state) => QuizPage(
                level: state.extra as int,
              ),
            ),
            GoRoute(
              path: 'spinner',
              builder: (context, state) => const SpinnerPage(),
            ),
            GoRoute(
              path: 'win',
              builder: (context, state) => WinPage(
                coin: state.extra as int,
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/shop',
      builder: (context, state) => const ShopPage(),
    ),
    GoRoute(
      path: '/rules',
      builder: (context, state) => const RulesPage(),
    ),
    GoRoute(
      path: '/instruct',
      builder: (context, state) => InstructPage(
        level: state.extra as int,
      ),
    ),
  ],
);
