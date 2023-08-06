import 'package:appwash/utils/constants/app_colors.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/theme/theme_controller.dart';
import 'package:appwash/utils/widgets/scaffo.dart';
import 'package:appwash/views/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeSettingscreen extends StatelessWidget {
  ThemeSettingscreen({super.key});
  final ThemeController themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffo(
        appBarBottomChild: const SizedBox.shrink(),
        appBar: AppBar(
          title: Text("Theme",
              style: TextStyles.normalText(context,
                  fontWeight: FontWeight.w600, color: AppColors.white)),
        ),
        bodyPadding: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: paddingV),
            WidgetSettings.settingTile(
              context,
              title: "Light Mode",
              selected: themeController.mode == AppTheme.LIGHT,
              onClick: () {
                themeController.change(AppTheme.LIGHT);
              },
              leading: const Icon(Icons.light_mode, size: 22),
            ),
            WidgetSettings.settingTile(
              context,
              title: "Dark Mode",
              selected: themeController.mode == AppTheme.DART,
              onClick: () {
                themeController.change(AppTheme.DART);
              },
              leading: const Icon(Icons.nights_stay_outlined, size: 22),
            ),
            WidgetSettings.settingTile(
              context,
              title: "Default Mode",
              selected: themeController.mode == AppTheme.SYSTEM,
              onClick: () {
                themeController.change(AppTheme.SYSTEM);
              },
              leading: const Stack(
                alignment: Alignment.topLeft,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 6),
                    child: Icon(Icons.light_mode, size: 18),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Icon(Icons.nights_stay_outlined, size: 20),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
