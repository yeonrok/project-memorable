import 'package:flutter/material.dart';

import 'foundation/app_theme.dart';
import 'res/palette.dart';
import 'res/typo.dart';

class DarkTheme implements AppTheme {
  @override
  Brightness brightness = Brightness.dark;

  @override
  AppColor color = AppColor(
    surface: Palette.grey800,
    background: Palette.surface100,
    text: Palette.grey100,
    subtext: Palette.grey500,
    toastContainer: Palette.grey100.withOpacity(0.85),
    onToastContainer: Palette.grey800,
    hint: Palette.grey350,
    hintContainer: Palette.white,
    onHintContainer: Palette.grey350,
    inactive: Palette.grey500,
    inactiveContainer: Palette.grey100,
    onInactiveContainer: Palette.white,
    primary: Palette.primary600,
    onPrimary: Palette.surface100,
    secondary: Palette.primary500,
    onSecondary: Palette.surface200,
    tertiary: Palette.primary400,
    onTertiary: Palette.surface300,
  );

  @override
  late AppTypo typo = AppTypo(
    typo: const Pretendard(),
    fontColor: color.text,
  );

  @override
  AppDeco deco = AppDeco(
    shadow: [
      BoxShadow(
        color: Palette.black.withOpacity(0.35),
        blurRadius: 35,
      ),
    ],
  );
}
