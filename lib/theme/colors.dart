import 'package:flutter/material.dart' as material;

class FontSize {
  static const xs = 12.0;
  static const sm = 14.0;
  static const md = 16.0;
  static const lg = 18.0;
  static const xl = 24.0;
  static const xxl = 36.0;
}


class BorderRadius {
  static const zero = 0.0;
  static const r2 = 2.0;
  static const r4 = 4.0;
  static const r8 = 8.0;
  static const r16 = 16.0;
  static const r30 = 30.0;
}

class Spacing {
  static const zero = 0.0;
  static const s4 = 4.0;
  static const s12 = 12.0;
  static const s24 = 24.0;
  static const s40 = 40.0;
}

class Color {

  //light theme
  static const white = material.Color(0xFFFFFFFF);
  static const blue = material.Color(0xFF007991);
  static const blue2 = material.Color(0xFF639FAB);
  static const coffee = material.Color(0xFFA18276);
  static const black = material.Color(0xFF000000);
  //dark theme
  static const dgrey = material.Color(0xFF4A525A);
  static const dblue = material.Color(0xFF2E5266);
  static const dblue2 = material.Color(0xFF47A8BD);

  //answers
  static const error = material.Color(0xFFD72B0D);
  static const warning = material.Color(0xFFEDC200);
  static const success = material.Color(0xFF21C058);

  static const transparent = material.Color(0x00FFFFFF);
}
