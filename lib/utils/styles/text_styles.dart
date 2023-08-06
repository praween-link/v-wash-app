import 'package:appwash/utils/constants/app_colors.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:flutter/material.dart';

class TextStyles {
  /// App Bar

  static TextStyle appBarTitle(context) =>
      TextStyle(fontSize: FontSizes.headerBig, fontWeight: FontWeight.w600);

  /// Auth
  static TextStyle authMainTitle(context,
          {Color? color, bool isGrey = false, FontWeight? fontWeight}) =>
      TextStyle(
          fontSize: FontSizes.headerVeryVeryBig,
          color: color ?? (isGrey ? AppColors.greyNormal : null),
          fontWeight: fontWeight);

  /// Input Field
  static TextStyle inputFieldTitle(context) =>
      TextStyle(fontSize: FontSizes.headerMedium, fontWeight: FontWeight.w400);

  /// Button
  static TextStyle buttonText(context, {Color? color}) => TextStyle(
      fontSize: FontSizes.headerMedium,
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.white);

  ///

  static TextStyle normalText(context,
          {Color? color, bool isGrey = false, FontWeight? fontWeight}) =>
      TextStyle(
          fontWeight: fontWeight,
          fontSize: FontSizes.normal,
          color: color ?? (isGrey ? AppColors.greyNormal : null));
  static TextStyle mediumText(context,
          {Color? color, bool isGrey = false, FontWeight? fontWeight}) =>
      TextStyle(
          fontWeight: fontWeight,
          fontSize: FontSizes.textMedium,
          color: color ?? (isGrey ? AppColors.greyNormal : null));
  static TextStyle largText(context,
          {Color? color,
          bool isGrey = false,
          FontWeight? fontWeight,
          double? fontSize}) =>
      TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize ?? FontSizes.textBig,
          color: color ?? (isGrey ? AppColors.greyNormal : null));
  static TextStyle smallText(context,
          {Color? color, FontWeight? fontWeight, bool isGrey = false}) =>
      TextStyle(
          fontSize: FontSizes.textSmall,
          fontWeight: fontWeight,
          color: color ?? (isGrey ? AppColors.greyNormal : null));
  static TextStyle verySmallText(context,
          {Color? color,
          bool isGrey = false,
          FontStyle? fontStyle,
          double? height}) =>
      TextStyle(
        fontSize: FontSizes.textVerySmall,
        color: color ?? (isGrey ? AppColors.greyNormal : null),
        fontStyle: fontStyle,
        height: height,
      );

  static TextStyle veryVerySmallText(context,
          {Color? color, bool isGrey = false}) =>
      TextStyle(
          fontSize: FontSizes.textVeryVerySmall,
          color: color ?? (isGrey ? AppColors.greyNormal : null));
}
