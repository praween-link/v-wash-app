import 'package:appwash/utils/local_db/local_db_info.dart';
import 'package:flutter/material.dart';

//
class AppColors {
  static Color getColor(String colorStr) => Color(int.parse("0xFF$colorStr"));
  //
  static int primaryColor = (LocalInfo.primaryColor ?? '') == ''
      ? 0xFF5297FF
      : int.parse(LocalInfo.primaryColor); //0xfffc4103; //
  // static int primaryColor = 0xFF5297FF;
  static Color primary = Color(primaryColor);
  static Color transparent = Colors.transparent;
  static Color appBodyColorDark = Colors.grey.shade800;
  static Color appBodyColorLight = AppColors.white;
  //
  // static Color appBodyColor(context, {bool reverse = false}) => reverse
  //     ? (isDarkMode(context) ? appBodyColorLight : appBodyColorDark)
  //     : isDarkMode(context)
  //         ? appBodyColorDark
  //         : appBodyColorLight;
  //
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF202020);
  static const Color greyNormal = Color(0xFF929292);
  static Color red = const Color(0xFFff0000).withOpacity(0.8);
  static Color orange = const Color(0xFFFF8C00);
  static Color green = const Color.fromARGB(255, 13, 153, 51);
  static Color blue = const Color(0xFF5297FF);
  //
  static const Color grey = Color(0xFFc1c5c9);
  static const Color grey2 = Color.fromARGB(255, 140, 141, 142);
  static const Color grey4 = Color.fromARGB(255, 76, 76, 76);
  static const Color grey5 = Color.fromARGB(255, 59, 59, 59);
  static const Color grey6 = Color.fromARGB(255, 45, 45, 45);
  static const Color grey8 = Color.fromARGB(255, 23, 23, 23);
  //
  static Color divider = grey;

  ///-------------240, 145, 12
  static Map<int, Color> color = {
    50: const Color.fromRGBO(82, 151, 255, 0),
    100: const Color.fromRGBO(82, 151, 255, .2),
    200: const Color.fromRGBO(82, 151, 255, .3),
    300: const Color.fromRGBO(82, 151, 255, .4),
    400: const Color.fromRGBO(82, 151, 255, .5),
    500: const Color.fromRGBO(82, 151, 255, .6),
    600: const Color.fromRGBO(82, 151, 255, .7),
    700: const Color.fromRGBO(82, 151, 255, .8),
    800: const Color.fromRGBO(82, 151, 255, .9),
    900: const Color.fromRGBO(82, 151, 255, 1),
  };
  static MaterialColor materialPrimayColor() =>
      MaterialColor(primaryColor, color);
}
