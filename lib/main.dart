import 'dart:developer';

import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/local_db/local_db.dart';
import 'package:appwash/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfs/flutter_sfs.dart';
import 'package:get/get.dart';

import 'routes/routes.dart';
import 'utils/local_db/local_db_info.dart';
import 'utils/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDB.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    log("Local Primary Color: ${LocalInfo.primaryColor}");
    return SfsInitBuilder(
      mobileSize: const Size(360, 650),
      fontSizeRange: FontSizes.normalRange, // Normal font size
      multiFontSizeRange: {
        fsabs: FontSizes.appBarFontSizeRange,

        /// HEADER TEXT FONT RANGE
        fshvvb: FontSizes.headerVeryVeryBigRange,
        fshvb: FontSizes.headerVeryBigRange,
        fshb: FontSizes.headerBigRange,
        fshm: FontSizes.headerMediumRange,
        fshs: FontSizes.headerSmallRange,
        fshvs: FontSizes.headerVerySmallRange,

        /// HEADER TEXT FONT RANGE
        fstb: FontSizes.textBigRange,
        fstm: FontSizes.textMediumRange,
        fsts: FontSizes.textSmallRange,
        fstvs: FontSizes.textVerySmallRange,
        fstvvs: FontSizes.textVeryVerySmallRange,

        /// Common
        n: FontSizes.normalRange,
      },
      divideRange: DivideRange(
        pergMob: Range(min: 0, max: 60), //60%
        pergTab: Range(min: 0, max: 100), //100%
      ),
      builder: (context, child) {
        ThemeController themeController =
            Get.put(ThemeController(), permanent: true);
        return Obx(
          () => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: sfsNavigatorKey,
            title: 'App Wash',
            // Theme
            themeMode: themeController.themeMode(),

            darkTheme: AppThemes.dartTheme(),
            theme: AppThemes.lightTheme(),
            // Routes
            initialRoute: AppRoutes.INITIAL,
            getPages: AppRoutes.routes,
          ),
        );
      },
    );
  }
}
