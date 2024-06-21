import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

int level = 1;
int coins = 150;
int sec = 30;
int bgID = 1;

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  level = prefs.getInt('level') ?? 5;
  coins = prefs.getInt('coins') ?? 150;
  sec = prefs.getInt('sec') ?? 30;
  bgID = prefs.getInt('bgID') ?? 1;

  log('level = $level');
  log('coins = $coins');
  log('sec = $sec');
  log('bgID = $bgID');
}

Future<void> setBg(int id) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('bgID', id);
  bgID = id;
}

bool getLocked(int lvl) {
  return lvl >= level + 1;
}

bool getCurrent(int current) {
  return current >= level;
}
