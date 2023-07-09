import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

brightness(context) => MediaQuery.of(context).platformBrightness;
bool isDarkMode(context) => brightness(context) == Brightness.dark;

Color lightPrimaryColor = AppColors.primary;
Color darkPrimaryColor = AppColors.primary.withOpacity(0.8);
Color appDarkColor = darkPrimaryColor;
Color appLightColor = lightPrimaryColor;

// log(isDarkMode.toString());
class AppThemes {
  /// Dark Theme
  static ThemeData dartTheme() => ThemeData(
        brightness: Brightness.dark,
        // fontFamily: 'lato',
        fontFamily: 'Jost',
        scaffoldBackgroundColor: AppColors.appBodyColorDark,
        // primarySwatch: AppColors.materialPrimayColor(),
        appBarTheme: ThemeModules.appBarStyle(isDark: true),
        textTheme: ThemeModules.appTextStyle(isDark: true),
        elevatedButtonTheme: ThemeModules.appElevatedButtonStyle(isDark: true),
        dividerColor: AppColors.appBodyColorLight
            .withOpacity(0.5), //Colors.blueGrey.withOpacity(0.5),
        dividerTheme: const DividerThemeData(thickness: 0.5, space: 0),
        primaryColor: darkPrimaryColor,
        //
        iconTheme: const IconThemeData(color: Colors.white70),
        colorScheme: ColorScheme.dark(
          primary: darkPrimaryColor,
          // onPrimary: darkPrimaryColor,
          secondary: Colors.red,
          background: const Color.fromARGB(255, 34, 44, 50),
          //
          shadow: Colors.black.withOpacity(0.2),
        ),
        primaryTextTheme: ThemeModules.appTextStyle(isDark: true),
        // textButtonTheme: TextButtonThemeData(
        //     style: ButtonStyle(
        //         textStyle: MaterialStateProperty.all(
        //             TextStyle(color: AppColors.primaryDark))))
      );

  /// ============================================================================
  /// Light Theme
  static ThemeData lightTheme() => ThemeData(
        brightness: Brightness.light,
        // fontFamily: 'lato',
        fontFamily: 'Jost',
        scaffoldBackgroundColor: AppColors.appBodyColorLight,
        // primarySwatch: AppColors.materialPrimayColor(),
        appBarTheme: ThemeModules.appBarStyle(isDark: false),
        textTheme: ThemeModules.appTextStyle(isDark: false),
        elevatedButtonTheme: ThemeModules.appElevatedButtonStyle(isDark: false),
        dividerColor: AppColors.appBodyColorDark
            .withOpacity(0.5), //Colors.blueGrey.withOpacity(0.5),
        dividerTheme: const DividerThemeData(thickness: 0.5, space: 0),
        primaryColor: lightPrimaryColor,

        //
        primaryTextTheme: ThemeModules.appTextStyle(isDark: false),
        iconTheme: IconThemeData(color: Colors.blueGrey.shade400),
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          // onPrimary: AppColors.primary,
          secondary: Colors.red,
          background: Colors.white70,
          //
          shadow: Colors.grey.shade500.withOpacity(0.2), // Card shadow
        ),
        // textButtonTheme: TextButtonThemeData(
        //     style: ButtonStyle(
        //         textStyle: MaterialStateProperty.all(
        //             TextStyle(color: AppColors.primary))))
      );
}

/// Common Themes
class ThemeModules {
  static appBarStyle({bool isDark = false}) => AppBarTheme(
        backgroundColor: isDark ? darkPrimaryColor : lightPrimaryColor,
        // centerTitle: true,
        foregroundColor: Colors.white70,
        elevation: 0,
      );
  static appTextStyle({bool isDark = false}) => TextTheme(
        bodyMedium: TextStyle(
          color: isDark ? Colors.white70 : AppColors.black,
        ),
        bodySmall: TextStyle(
          color: isDark ? Colors.white70 : AppColors.black,
          fontWeight: FontWeight.w300,
        ),
        //
        titleLarge: TextStyle(
          color: isDark ? Colors.white70 : AppColors.black,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: isDark ? Colors.white70 : AppColors.black,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: isDark ? Colors.white70 : AppColors.black,
          fontWeight: FontWeight.w500,
        ),
        //
        displayMedium: TextStyle(
          color: isDark ? Colors.white70 : AppColors.black,
        ),
      );
  static appElevatedButtonStyle({bool isDark = false}) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: isDark ? darkPrimaryColor : lightPrimaryColor,
          // shadowColor: Colors.grey,
          textStyle: const TextStyle(
            color: Colors.white70,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          elevation: 6,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          minimumSize: const Size(80, 50),
        ),
      );
}
