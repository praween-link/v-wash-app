import 'package:appwash/routes/paths.dart';
import 'package:appwash/utils/constants/app_colors.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sub/theme_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: paddingV),
          _WidgetSettings.settingTile(context,
              title: "Account Details",
              onClick: () => Get.toNamed(Routes.ACCOUNT_DETAILS)),
          _WidgetSettings.settingTile(context,
              title: "My Vehicles",
              onClick: () => Get.toNamed(Routes.MY_VEHICLES)),
          _WidgetSettings.settingTile(context,
              title: "Histories",
              onClick: () => Get.toNamed(Routes.BOOKING_HISTORY)),
          _WidgetSettings.settingTile(context,
              title: "Theme",
              onClick: () => Get.to(() => ThemeSettingscreen())),
          _WidgetSettings.settingTile(context,
              title: "Logout", titleColor: AppColors.red, onClick: () {
            AppDialogs.logout(context, confirm: () {});
          }),
          // _WidgetSettings.settingTile(context,
          //     title: "Primary 1",
          //     titleColor: const Color(0xFF7d0aa3), onClick: () {
          //   LocalInfoSave.saveData(LocalKeys.primary_color, "0xFF7d0aa3");
          //   // SystemNavigator.pop();
          //   // main();
          // }),
          // _WidgetSettings.settingTile(context,
          //     title: "Primary 2",
          //     titleColor: const Color(0xFF5297FF), onClick: () {
          //   LocalInfoSave.saveData(LocalKeys.primary_color, "0xFF5297FF");
          //   // SystemNavigator.pop();
          //   // main();
          // }),
        ],
      ),
    );
  }
}

class _WidgetSettings {
  static Widget settingTile(context,
          {required String title,
          required Function onClick,
          Color? titleColor}) =>
      GestureDetector(
        onTap: () => onClick(),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: paddingH),
          padding: const EdgeInsets.symmetric(
              horizontal: paddingH, vertical: paddingV),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                blurStyle: BlurStyle.normal,
                color: Theme.of(context).colorScheme.shadow,
                offset: const Offset(-0.5, 5),
              ),
              BoxShadow(color: Theme.of(context).scaffoldBackgroundColor),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyles.mediumText(context,
                      fontWeight: FontWeight.w600, color: titleColor),
                ),
              ),
              const Icon(Icons.keyboard_arrow_right, size: 22),
            ],
          ),
        ),
      );
}
