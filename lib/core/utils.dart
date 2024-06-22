import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

int level = 1;
int coins = 150;
int timerSec = 10;
int bgId = 1;
bool sec5 = false;
bool sec10 = false;
bool sec15 = false;
bool sec20 = false;
bool bg2 = false;
bool bg3 = false;
bool bg4 = false;
bool bg5 = false;

Future<void> resetAll() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('level');
  await prefs.remove('coins');
  await prefs.remove('timerSec');
  await prefs.remove('bgId');
  await prefs.remove('sec5');
  await prefs.remove('sec10');
  await prefs.remove('sec15');
  await prefs.remove('sec20');
  await prefs.remove('bg2');
  await prefs.remove('bg3');
  await prefs.remove('bg4');
  await prefs.remove('bg5');
}

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await resetAll();
  level = prefs.getInt('level') ?? 1;
  coins = prefs.getInt('coins') ?? 150;
  timerSec = prefs.getInt('timerSec') ?? 60;
  bgId = prefs.getInt('bgId') ?? 1;
  sec5 = prefs.getBool('sec5') ?? false;
  sec10 = prefs.getBool('sec10') ?? false;
  sec15 = prefs.getBool('sec15') ?? false;
  sec20 = prefs.getBool('sec20') ?? false;
  bg2 = prefs.getBool('bg2') ?? false;
  bg3 = prefs.getBool('bg3') ?? false;
  bg4 = prefs.getBool('bg4') ?? false;
  bg5 = prefs.getBool('bg5') ?? false;

  log('timerSec = $timerSec');
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

Future<void> changeSec(int sec) async {
  final prefs = await SharedPreferences.getInstance();
  if (sec == 5 && !sec5 && coins >= 50) {
    sec5 = true;
    timerSec = timerSec + 5;
    coins = coins - 50;
    await prefs.setInt('timerSec', timerSec);
    await prefs.setInt('coins', coins);
    await prefs.setBool('sec5', true);
  }
  if (sec == 10 && !sec10 && coins >= 100) {
    sec10 = true;
    timerSec = timerSec + 10;
    coins = coins - 100;
    await prefs.setInt('timerSec', timerSec);
    await prefs.setInt('coins', coins);
    await prefs.setBool('sec10', true);
  }
  if (sec == 15 && !sec15 && coins >= 150) {
    sec15 = true;
    timerSec = timerSec + 15;
    coins = coins - 150;
    await prefs.setInt('timerSec', timerSec);
    await prefs.setInt('coins', coins);
    await prefs.setBool('sec15', true);
  }
  if (sec == 20 && !sec20 && coins >= 250) {
    sec20 = true;
    timerSec = timerSec + 20;
    coins = coins - 250;
    await prefs.setInt('timerSec', timerSec);
    await prefs.setInt('coins', coins);
    await prefs.setBool('sec20', true);
  }
}

Future<void> changeBackground(int id) async {
  final prefs = await SharedPreferences.getInstance();
  if (id == 1) {
    bgId = 1;
    await prefs.setInt('bgId', bgId);
  }
  if (id == 2) {
    if (!bg2 && coins >= 300) {
      coins = coins - 300;
      bg2 = true;
      await prefs.setInt('coins', coins);
      await prefs.setBool('bg2', bg2);
    }
    if (bg2) {
      bgId = 2;
      await prefs.setInt('bgId', bgId);
    }
  }
  if (id == 3) {
    if (!bg3 && coins >= 350) {
      coins = coins - 350;
      bg3 = true;
      await prefs.setInt('coins', coins);
      await prefs.setBool('bg3', bg3);
    }
    if (bg3) {
      bgId = 3;
      await prefs.setInt('bgId', bgId);
    }
  }
  if (id == 4) {
    if (!bg4 && coins >= 450) {
      coins = coins - 450;
      bg4 = true;
      await prefs.setInt('coins', coins);
      await prefs.setBool('bg4', bg4);
    }
    if (bg4) {
      bgId = 4;
      await prefs.setInt('bgId', bgId);
    }
  }
  if (id == 5) {
    if (!bg5 && coins >= 500) {
      coins = coins - 500;
      bg5 = true;
      await prefs.setInt('coins', coins);
      await prefs.setBool('bg5', bg5);
    }
    if (bg5) {
      bgId = 5;
      await prefs.setInt('bgId', bgId);
    }
  }
}
