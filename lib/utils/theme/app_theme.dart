// import 'package:flutter/material.dart';

// import '../constants/app_colors.dart';
// import '../constants/app_font_size.dart';

// brightness(context) => MediaQuery.of(context).platformBrightness;
// // bool isDarkMode(context) => brightness(context) == Brightness.dark;

// Color lightPrimaryColor = AppColors.primary;
// Color darkPrimaryColor = AppColors.primary.withOpacity(0.8);
// Color appDarkColor = darkPrimaryColor;
// Color appLightColor = lightPrimaryColor;

// // log(isDarkMode.toString());
// class AppThemes {
//   /// Dark Theme
//   static ThemeData dartTheme() => ThemeData(
//         brightness: Brightness.dark,
//         // fontFamily: 'lato',
//         fontFamily: 'Jost',
//         scaffoldBackgroundColor: AppColors.appBodyColorDark, //darkPrimaryColor,
//         primarySwatch: AppColors.materialPrimayColor(),
//         appBarTheme: ThemeModules.appBarStyle(isDark: true),
//         textTheme: ThemeModules.appTextStyle(isDark: true),
//         elevatedButtonTheme: ThemeModules.appElevatedButtonStyle(isDark: true),
//         dividerColor: AppColors.divider,
//         dividerTheme: const DividerThemeData(thickness: 0.5, space: 0),
//         //
//       );

//   /// ============================================================================
//   /// Light Theme
//   static ThemeData lightTheme() => ThemeData(
//         brightness: Brightness.light,
//         // fontFamily: 'lato',
//         fontFamily: 'Jost',
//         scaffoldBackgroundColor:
//             AppColors.appBodyColorDark, //lightPrimaryColor,
//         primarySwatch: AppColors.materialPrimayColor(),
//         appBarTheme: ThemeModules.appBarStyle(isDark: false),
//         textTheme: ThemeModules.appTextStyle(isDark: false),
//         elevatedButtonTheme: ThemeModules.appElevatedButtonStyle(isDark: false),
//         dividerColor: AppColors.divider,
//         dividerTheme: const DividerThemeData(thickness: 0.5, space: 0),
//       );
// }

// /// Common Themes
// class ThemeModules {
//   static appBarStyle({bool isDark = false}) => AppBarTheme(
//         backgroundColor: isDark ? AppColors.primary : lightPrimaryColor,
//         // centerTitle: true,
//         elevation: 0,
//       );
//   static appTextStyle({bool isDark = false}) => const TextTheme(
//         bodyMedium: TextStyle(color: AppColors.white),
//       );
//   static appElevatedButtonStyle({bool isDark = false}) =>
//       ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: isDark ? darkPrimaryColor : lightPrimaryColor,
//           shadowColor: AppColors.grey,
//           textStyle: TextStyle(
//             color: AppColors.white,
//             fontSize: FontSizes.appBarFontSize,
//             fontWeight: FontWeight.w600,
//           ),
//           elevation: 6,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//           minimumSize: const Size(80, 50),
//         ),
//       );
// }
