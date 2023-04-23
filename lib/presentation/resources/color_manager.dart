import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = const Color(0xff3276fc);
  static Color secondary = const Color(0xff9bbdfc);
  static Color lightPrimary = const Color(0xffecf1fc);

  static Color green = const Color(0xff15bd7b);

  static Color black = Colors.black;
  static Color darkGrey = const Color(0xff525252);
  static Color grey = Colors.grey;
  static Color grey2 = Colors.grey.shade400;
  static Color lightGrey = const Color(0xffe8e8e8);
  static Color veryLightGrey = const Color(0xfff5f5f5);

  static Color white = const Color(0xffFFFFFF);
  static Color error = const Color(0xffe61f34); // red
  // color
  static MaterialColor materialPrimary = MaterialColor(0xff3276fc, color);
}

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};
