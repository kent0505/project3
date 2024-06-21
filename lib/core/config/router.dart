import 'package:go_router/go_router.dart';

import '../../features/home/pages/level_page.dart';
import '../../features/home/pages/rules_page.dart';
import '../../features/home/pages/shop_page.dart';
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
      path: '/quiz',
      builder: (context, state) => QuizPage(
        level: state.extra as int,
      ),
    ),
  ],
);
