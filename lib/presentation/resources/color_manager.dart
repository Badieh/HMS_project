import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = const Color(0xff3276fc);
  static Color secondary = const Color(0xff9bbdfc);
  static Color lightPrimary = const Color(0xffecf1fc);


  static Color black = Colors.black;
  static Color lightBlack = const Color(0xff2a2a2a);

  static Color darkGrey = const Color(0xff525252);
  static Color grey = Colors.grey;
  static Color grey2 = Colors.grey.shade400;
  static Color lightGrey = const Color(0xffe8e8e8);
  static Color veryLightGrey = const Color(0xfff5f5f5);

  static Color pink = Colors.pinkAccent;

  static Color white = const Color(0xffFFFFFF);
  static Color error = const Color(0xffe61f34); // red
  static Color success = const Color(0xff15bd7b); // red
  // color
  static MaterialColor myCustomColor = MaterialColor(0xff3276fc, {
    50: Color(0xff3276fc).withOpacity(0.1),
    100: Color(0xff3276fc).withOpacity(0.2),
    200: Color(0xff3276fc).withOpacity(0.3),
    300: Color(0xff3276fc).withOpacity(0.4),
    400: Color(0xff3276fc).withOpacity(0.5),
    500: Color(0xff3276fc).withOpacity(0.6),
    600: Color(0xff3276fc).withOpacity(0.7),
    700: Color(0xff3276fc).withOpacity(0.8),
    800: Color(0xff3276fc).withOpacity(0.9),
  });
  static MaterialColor materialPrimary = MaterialColor(0xff3276fc, color);
}

Map<int, Color> color = {
  50: Color.fromRGBO(50, 118, 252, 0.1),
  100: Color.fromRGBO(50, 118, 252, 0.2),
  200: Color.fromRGBO(50, 118, 252, 0.3),
  300: Color.fromRGBO(50, 118, 252, 0.4),
  400: Color.fromRGBO(50, 118, 252, 0.5),
  500: Color.fromRGBO(50, 118, 252, 0.6),
  600: Color.fromRGBO(50, 118, 252, 0.7),
  700: Color.fromRGBO(50, 118, 252, 0.8),
  800: Color.fromRGBO(50, 118, 252, 0.9),
  900: Color.fromRGBO(50, 118, 252, 1),
};
