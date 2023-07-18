import 'dart:developer' as prints;

import 'package:appwash/utils/images/icons_path.dart';
import 'package:appwash/viewmodel/app_home/main_home_viewmodel.dart';
import 'package:appwash/routes/paths.dart';
import 'package:appwash/utils/constants/app_colors.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/scaffo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'btm_nav_item_tabs/dashboard/dashboard_screen.dart';
import 'btm_nav_item_tabs/notification/notifications_screen.dart';
import 'btm_nav_item_tabs/settings/settings_screen.dart';
import 'btm_nav_item_tabs/wash_plan/wash_plan_screen.dart';

class MainHome extends StatelessWidget {
  MainHome({super.key, this.appBar});
  PreferredSizeWidget? appBar;
  bool isMenuLeading = false;
  //
  List<BtmNavItem> itemTabs = [
    BtmNavItem(
        icon: const Padding(
          padding: EdgeInsets.only(top: 5),
          child: Icon(Icons.home, color: AppColors.white, size: 26),
        ),
        textStyle:
            TextStyle(color: AppColors.white, fontSize: FontSizes.headerSmall),
        lebel: "Home"),
    BtmNavItem(
        icon: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 2),
          child: Image.asset(
            AppIcons.rupee,
            height: 18,
            width: 18,
            color: AppColors.white,
          ),
        ),
        textStyle:
            TextStyle(color: AppColors.white, fontSize: FontSizes.headerSmall),
        lebel: "Wash Plans"),
    BtmNavItem(
        icon: const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Icon(Icons.notifications, color: AppColors.white, size: 26)),
        textStyle:
            TextStyle(color: AppColors.white, fontSize: FontSizes.headerSmall),
        lebel: "Notifications"),
    BtmNavItem(
        icon: const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Icon(Icons.settings, color: AppColors.white, size: 26)),
        textStyle:
            TextStyle(color: AppColors.white, fontSize: FontSizes.headerSmall),
        lebel: "Settings"),
  ];

  List<Widget> bodyItems = [
    DashboardScreen(),
    WashPlanScreen(),
    NotificationScreen(),
    SettingScreen(),
  ];

  final MainHomeViewmodel mainHomeVm = Get.put(MainHomeViewmodel());
  List<String> titles = ["Home", "Wash Plans", "Notifications", "Settings"];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (mainHomeVm.currentScreenIndex.value == 0) {
          return true;
        } else {
          mainHomeVm.currentScreenIndex.value = 0;
          return false;
        }
      },
      child: Obx(
        () => Scaffo(
            appDrawer: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: paddingH),
                    child: InkWell(
                        onTap: () {
                          mainHomeVm.isAppDrawerOpen.value = false;
                        },
                        child: const Icon(Icons.close,
                            size: 32, color: AppColors.white)),
                  ),
                  const SizedBox(height: paddingV),
                  drawerTile(context, title: "About Us", onClick: () {
                    mainHomeVm.drawerSelectedTile.value = 0;
                    mainHomeVm.isAppDrawerOpen.value = false;
                    Get.toNamed(Routes.ABOUT_US);
                  }, selected: mainHomeVm.drawerSelectedTile.value == 0),
                  const SizedBox(height: paddingV),
                  drawerTile(context, title: "Help & Support", onClick: () {
                    mainHomeVm.drawerSelectedTile.value = 1;
                    mainHomeVm.isAppDrawerOpen.value = false;
                    Get.toNamed(Routes.HELP_AND_SUPPORT);
                  }, selected: mainHomeVm.drawerSelectedTile.value == 1),
                  const SizedBox(height: paddingV),
                  drawerTile(context, title: "Privacy Policy", onClick: () {
                    mainHomeVm.drawerSelectedTile.value = 2;
                    mainHomeVm.isAppDrawerOpen.value = false;
                    Get.toNamed(Routes.PRIVACY_POLICY);
                  }, selected: mainHomeVm.drawerSelectedTile.value == 2),
                  const SizedBox(height: paddingV),
                  drawerTile(context, title: "Terms & Conditions", onClick: () {
                    mainHomeVm.drawerSelectedTile.value = 3;
                    mainHomeVm.isAppDrawerOpen.value = false;
                    Get.toNamed(Routes.TERMS_AND_CONDITIONS);
                  }, selected: mainHomeVm.drawerSelectedTile.value == 3),
                ],
              ),
            ),
            appDrawerOpen: mainHomeVm.isAppDrawerOpen.value,
            bodyPadding: EdgeInsets.zero,
            appBar: AppBar(
              // backgroundColor: AppColors.transparent,
              elevation: 0,
              leading: InkWell(
                  onTap: () {
                    mainHomeVm.isAppDrawerOpen.value =
                        !mainHomeVm.isAppDrawerOpen.value;
                  },
                  child: const Icon(Icons.menu, size: 22)),
              // titles[mainHomeVm.currentScreenIndex.value] ==
              //         "Dashboard"
              //     ? const Icon(Icons.menu, size: 22)
              //     : const Icon(Icons.arrow_back, size: 22),
              title: Text(titles[mainHomeVm.currentScreenIndex.value],
                  style: TextStyles.normalText(context,
                      fontWeight: FontWeight.w600, color: AppColors.white)),
            ),
            appBarBottomChild: const SizedBox.shrink(),
            scaffoBtmNavBar: ScaffoBtmNavBar(
              onChange: (index) {
                mainHomeVm.currentScreenIndex.value = index;
                prints.log(
                    "Clicked on Tab - ${mainHomeVm.currentScreenIndex.value}");
              },
              itemTabs: itemTabs,
              bodyItems: bodyItems,
              btmNavBarHeight: 55,
              currentIndex: mainHomeVm.currentScreenIndex.value,
              circularWidgetItem: Icon(Icons.add,
                  color: Theme.of(context).primaryColor, size: 32),
              centerItemClick: () => Get.toNamed(Routes.BOOKING),
              cirularItemBorderColor: AppColors.grey,
              cirularItemBorderWidth: 3,
              btmNavBarDecoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
            child: bodyItems[mainHomeVm.currentScreenIndex.value]),
      ),
    );
  }

  Widget drawerTile(context,
          {required String title,
          required Function onClick,
          bool selected = false}) =>
      GestureDetector(
        onTap: () => onClick(),
        child: Row(
          children: [
            Container(
              height: 24,
              color: selected ? AppColors.white : AppColors.transparent,
              width: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingH),
              child: Text(
                title,
                style: TextStyles.largText(context,
                    color: AppColors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      );
}
