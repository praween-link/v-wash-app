import 'package:appwash/routes/paths.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/common_widgets.dart';
import 'package:appwash/utils/widgets/dialogs/dialogs.dart';
import 'package:appwash/viewmodel/app_home/dashboard/settings_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sub/theme_screen.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final SettingsViewmodel settingsViewmodel = Get.put(SettingsViewmodel());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingH),
            child: Obx(
              () => CommonWidgets.appImageSlider(
                  items: settingsViewmodel.sliderImages,
                  currentIndex: settingsViewmodel.currentSliderIndex.value,
                  onPageChanged: (index) {
                    settingsViewmodel.currentSliderIndex.value = index;
                  }),
            ),
          ),
          const SizedBox(height: paddingVn),
          WidgetSettings.settingTile(context,
              title: "Account Details",
              onClick: () => Get.toNamed(Routes.ACCOUNT_DETAILS)),
          WidgetSettings.settingTile(context,
              title: "My Vehicles",
              onClick: () => Get.toNamed(Routes.MY_VEHICLES)),
          WidgetSettings.settingTile(context,
              title: "Histories",
              onClick: () => Get.toNamed(Routes.BOOKING_HISTORY)),
          WidgetSettings.settingTile(context,
              title: "Theme",
              onClick: () => Get.to(() => ThemeSettingscreen())),
          WidgetSettings.settingTile(context, title: "Logout", onClick: () {
            AppDialogs.logout(context, confirm: () {});
          }),
          // WidgetSettings.settingTile(context,
          //     title: "Primary 1",
          //     titleColor: const Color(0xFF7d0aa3), onClick: () {
          //   LocalInfoSave.saveData(LocalKeys.primary_color, "0xFF7d0aa3");
          //   // SystemNavigator.pop();
          //   // main();
          // }),
          // WidgetSettings.settingTile(context,
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

class WidgetSettings {
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
