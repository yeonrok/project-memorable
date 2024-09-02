import 'package:flutter/material.dart';

import 'foundation/app_theme.dart';
import 'res/palette.dart';
import 'res/typo.dart';

class LightTheme implements AppTheme {
  @override
  Brightness brightness = Brightness.light;

  @override
  AppColor color = AppColor(
    surface: Palette.white, // grey800 -> white
    background: Palette.crimson, //grey80
    text: Palette.grey800,
    subtext: Palette.grey500,
    //subtext: Palette.crimson,
    toastContainer: Palette.black.withOpacity(0.85),
    onToastContainer: Palette.white,
    hint: Palette.grey350,
    hintContainer: Palette.white,
    onHintContainer: Palette.grey500,
    //onHintContainer: Palette.crimson,
    inactive: Palette.grey360,
    inactiveContainer: Palette.grey100, // TODO:: 추후 수정
    onInactiveContainer: Palette.white,
    primary: Palette.crimson,
    onPrimary: Palette.white,
    secondary: Palette.tangerine,
    onSecondary: Palette.white,
    tertiary: Palette.seafoamGreen,
    onTertiary: Palette.white,
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
        color: Palette.black.withOpacity(0.1),
        blurRadius: 35,
      ),
    ],
  );
}
