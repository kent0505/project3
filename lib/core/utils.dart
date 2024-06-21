import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

int level = 1;
int coins = 150;
int timerSec = 10;

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('level');
  // await prefs.remove('coins');
  level = prefs.getInt('level') ?? 2;
  coins = prefs.getInt('coins') ?? 150;
  coins = prefs.getInt('timerSec') ?? 10;

  log('level = $level');
  log('coins = $coins');
}

bool getLocked(int lvl) {
  return lvl >= level + 1;
}

bool getCurrent(int current) {
  return current >= level;
}

Future<void> changeCoins(bool correct) async {
  final prefs = await SharedPreferences.getInstance();
  if (correct) {
    coins = coins + 10;
  } else {
    coins = coins - 10;
  }
  log(coins.toString());
  await prefs.setInt('coins', coins);
  await checkLevel();
}

Future<void> checkLevel() async {
  final prefs = await SharedPreferences.getInstance();
  if (coins >= 250) level = 3;
  if (coins >= 300) level = 4;
  if (coins >= 350) level = 5;
  await prefs.setInt('level', level);
}
