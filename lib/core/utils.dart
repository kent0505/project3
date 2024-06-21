import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

int level = 1;
int coins = 150;
int timerSec = 10;
bool bg2 = false;
bool bg3 = false;
bool bg4 = false;
bool bg5 = false;

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('level');
  // await prefs.remove('coins');
  level = prefs.getInt('level') ?? 1;
  coins = prefs.getInt('coins') ?? 150;
  timerSec = prefs.getInt('timerSec') ?? 10;
  bg2 = prefs.getBool('bg2') ?? false;
  bg3 = prefs.getBool('bg3') ?? false;
  bg4 = prefs.getBool('bg4') ?? false;
  bg5 = prefs.getBool('bg5') ?? false;
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
  if (coins >= 200) level = 2;
  if (coins >= 250) level = 3;
  if (coins >= 300) level = 4;
  if (coins >= 350) level = 5;
  await prefs.setInt('level', level);
}

Future<void> saveCoins(int coin) async {
  final prefs = await SharedPreferences.getInstance();
  coins = coins + coin;
  await prefs.setInt('coins', coins);
}
