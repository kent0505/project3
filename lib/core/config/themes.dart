import 'package:flutter/material.dart';

import 'app_colors.dart';

final theme = ThemeData(
  // general
  useMaterial3: false,
  primarySwatch: Colors.blueGrey,
  fontFamily: 'Inter',
  scaffoldBackgroundColor: AppColors.bg,
  // textfield
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.accent,
    selectionColor: AppColors.accent,
    selectionHandleColor: AppColors.accent,
  ),
  // overscroll indicator color
  colorScheme: ColorScheme.fromSwatch(
    accentColor: AppColors.accent,
  ),
);
