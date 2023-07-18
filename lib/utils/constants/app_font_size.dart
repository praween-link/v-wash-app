import 'package:flutter_sfs/flutter_sfs.dart';
import 'package:get/get.dart';

/// APP SCREEN PADDING
const double paddingV = 20;
const double paddingH = 20;
const double paddingVn = 8;
const double paddingHn = 8;
double height = Get.size.height;
double width = Get.size.width;

/// SFS font size keys
String fsabs = 'appBarFontSize';

/// HEADER TEXT FONT KEY
String fshvvb = 'headerVeryVeryBig';

String fshvb = 'headerVeryBig';
String fshb = 'headerBig';
String fshm = 'headerMedium';
String fshs = 'headerSmall';
String fshvs = 'headerVerySmall';

/// HEADER TEXT FONT KEY
String fstb = 'textBig';
String fstm = 'textMedium';
String fsts = 'textSmall';
String fstvs = 'textVerySmall';
String fstvvs = 'textVeryVerySmall';
String n = 'normal';

class FontSizes {
  static double appBarFontSize = 22; //.fs(fsabs);
  static Range appBarFontSizeRange = Range(min: 18, max: 24);

  /// HEADER TEXT FONT SIZE
  static double headerVeryVeryBig = 26.fs(fshvvb);
  static Range headerVeryVeryBigRange = Range(min: 22, max: 34);

  static double headerVeryBig = 22.fs(fshvb);
  static Range headerVeryBigRange = Range(min: 18, max: 26);

  static double headerBig = 16.fs(fshb);
  static Range headerBigRange = Range(min: 16, max: 22);

  static double headerMedium = 14.fs(fshm);
  static Range headerMediumRange = Range(min: 12, max: 20);

  static double headerSmall = 12.fs(fshs);
  static Range headerSmallRange = Range(min: 12, max: 18);

  static double headerVerySmall = 10.fs(fshvs);
  static Range headerVerySmallRange = Range(min: 10, max: 16);

  /// HEADER TEXT FONT SIZE

  static double textBig = 16.fs(fstb);
  static Range textBigRange = Range(min: 16, max: 22);

  static double textMedium = 14.fs(fstm);
  static Range textMediumRange = Range(min: 12, max: 20);

  static double textSmall = 12.fs(fsts);
  static Range textSmallRange = Range(min: 12, max: 18);

  static double textVerySmall = 10.fs(fstvs);
  static Range textVerySmallRange = Range(min: 10, max: 16);

  static double textVeryVerySmall = 8.fs(fstvvs);
  static Range textVeryVerySmallRange = Range(min: 8, max: 12);

  /// Common
  static double normal = textMedium;
  static Range normalRange = Range(min: 12, max: 20);
}
