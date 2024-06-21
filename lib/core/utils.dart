import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

int level = 1;
int coins = 150;

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('level');
  await prefs.remove('coins');
  level = prefs.getInt('level') ?? 1;
  coins = prefs.getInt('coins') ?? 150;

  log('level = $level');
  log('coins = $coins');
}

bool getLocked(int lvl) {
  return lvl >= level + 1;
}

bool getCurrent(int current) {
  return current >= level;
}
