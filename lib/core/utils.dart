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

int earnedCoins = 0;
void addCoins(bool correct) {
  if (correct) {
    earnedCoins = earnedCoins + 10;
  } else {
    earnedCoins = earnedCoins - 10;
  }
  log(earnedCoins.toString());
}

Future<void> saveCoins() async {
  final prefs = await SharedPreferences.getInstance();
  coins = coins + earnedCoins;
  earnedCoins = 0;
  await prefs.setInt('coins', coins);
}
