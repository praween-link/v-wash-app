import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/theme/theme_controller.dart';
import 'package:appwash/utils/widgets/scaffo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeSettingscreen extends StatelessWidget {
  ThemeSettingscreen({super.key});
  final ThemeController themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffo(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            themeController.change(AppTheme.LIGHT);
          },
          child: Text(
            "Light Mode",
            style: TextStyles.largText(context),
          ),
        ),
        TextButton(
          onPressed: () {
            themeController.change(AppTheme.DART);
          },
          child: Text(
            "Dark Mode",
            style: TextStyles.largText(context),
          ),
        ),
        TextButton(
          onPressed: () {
            themeController.change(AppTheme.SYSTEM);
          },
          child: Text(
            "Default Mode",
            style: TextStyles.largText(context),
          ),
        ),
      ],
    ));
  }
}
