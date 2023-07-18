import 'package:appwash/utils/constants/app_colors.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/images/icons_path.dart';
import 'package:appwash/utils/widgets/customs/drawer.dart';
import 'package:flutter/material.dart';

BoxDecoration scaffoBodyDecoration(context) => BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(45), topRight: Radius.circular(45)),
    );

class Scaffo extends StatelessWidget {
  Scaffo({
    super.key,
    required this.child,
    this.appBarBottomChild,
    this.appBar,
    this.bodyPadding,
    this.scaffoBtmNavBar,
    this.appDrawerOpen = false,
    this.appDrawer,
  });
  final Widget child;
  Widget? appBarBottomChild;
  PreferredSizeWidget? appBar;
  EdgeInsetsGeometry? bodyPadding;
  ScaffoBtmNavBar? scaffoBtmNavBar;
  bool appDrawerOpen;
  Widget? appDrawer;

  @override
  Widget build(BuildContext context) {
    // Widget spaceHeight = const SizedBox(height: paddingV);
    // Widget spaceWidth = const SizedBox(height: paddingH);
    return AppDrawer(
      myDrawer: appDrawer ?? const SizedBox.shrink(),
      drawerBgColor: Theme.of(context).primaryColor,
      dividerColor: Theme.of(context).dividerColor,
      open: appDrawerOpen,
      body: Scaffold(
        appBar: appBar,
        body: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // BODY //
                Expanded(
                  child: // BODY //
                      SizedBox(
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 5,
                          color: Theme.of(context).primaryColor,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            appBarBottomChild ??
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: paddingV, top: paddingV * 3),
                                  child: Image.asset(AppIcons.appLogo,
                                      height: height * 0.15,
                                      width: width * 0.5),
                                ),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(45),
                                    topRight: Radius.circular(45)),
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: scaffoBodyDecoration(context),
                                  padding: bodyPadding ??
                                      const EdgeInsets.symmetric(
                                          horizontal: paddingH),
                                  child: child,
                                  // scaffoBtmNavBar == null
                                  //     ? child
                                  //     : scaffoBtmNavBar!.currentIndex == -1
                                  //         ? const SizedBox.shrink()
                                  //         : scaffoBtmNavBar!.bodyItems[
                                  //             scaffoBtmNavBar!.currentIndex],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Bottom Navbar default height
                scaffoBtmNavBar == null
                    ? const SizedBox.shrink()
                    : Container(
                        height: scaffoBtmNavBar!.btmNavBarHeight ?? 50,
                        color: Theme.of(context).scaffoldBackgroundColor),
              ],
            ),
            // Bottom Navbar
            scaffoBtmNavBar == null
                ? const SizedBox.shrink()
                : btmNavBar(
                    context,
                    onChange: scaffoBtmNavBar!.onChange,
                    items: scaffoBtmNavBar!.itemTabs,
                    centerItem: scaffoBtmNavBar!.circularWidgetItem ??
                        const Icon(Icons.add),
                    centerItemClick: scaffoBtmNavBar!.centerItemClick,
                    btmNavBarHeight: scaffoBtmNavBar!.btmNavBarHeight,
                    cirularItemRadius: scaffoBtmNavBar!.cirularItemRadius,
                    cirularItemBorderColor:
                        scaffoBtmNavBar!.cirularItemBorderColor,
                    cirularItemBorderWidth:
                        scaffoBtmNavBar!.cirularItemBorderWidth,
                    cirularItemColor: scaffoBtmNavBar!.cirularItemColor,
                    btmNavBarColor: scaffoBtmNavBar!.btmNavBarColor,
                    spacesInCenter: scaffoBtmNavBar!.spacesInCenter,
                    btmNavBarDecoration: scaffoBtmNavBar!.btmNavBarDecoration,
                  ),
          ],
        ),
        // bottomNavigationBar: BottomNavigationBar(items: const []),
      ),
    );
  }

  /// BOTTOM NVABAR WIDGETS
  Widget btmNavBar(
    context, {
    required List<BtmNavItem> items,
    required Widget centerItem,
    required Function centerItemClick,
    double? cirularItemRadius, //
    Color? cirularItemBorderColor, //
    double? cirularItemBorderWidth, //
    Color? cirularItemColor, //
    Color? btmNavBarColor,
    Decoration? btmNavBarDecoration,
    double? spacesInCenter,
    double? btmNavBarHeight,
    required Function(int) onChange,
  }) {
    int currentCircularIndex = 0;
    int len = items.length % 2 == 0 ? items.length : items.length - 1;
    List<BtmNavItem> newItemsList = [];
    for (int i = len - 1; i >= len ~/ 2; i--) {
      newItemsList.add(items[len - i - 1]);
    }
    currentCircularIndex = newItemsList.length;
    newItemsList.add(
      BtmNavItem(
          icon: const Icon(Icons.add),
          lebel: "hiden_circule",
          textStyle: const TextStyle()),
    );
    for (int i = len ~/ 2; i < len; i++) {
      newItemsList.add(items[i]);
    }

    return Column(
      children: [
        const Expanded(child: SizedBox.shrink()),
        Stack(
          children: [
            Container(
              // alignment: Alignment.bottomCenter,
              decoration: btmNavBarDecoration ??
                  BoxDecoration(
                      color:
                          btmNavBarColor ?? AppColors.white.withOpacity(0.5)),
              height: btmNavBarHeight ?? 50,
              margin: EdgeInsets.only(
                  top: (cirularItemRadius ?? 25) +
                      (cirularItemBorderWidth ?? 2)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: newItemsList.asMap().entries.map((item) {
                  return item.value.lebel == 'hiden_circule'
                      ? CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: (cirularItemRadius ?? 25) /
                              (spacesInCenter ?? 1.5))
                      : Flexible(
                          flex: 1,
                          child: Center(
                            child: GestureDetector(
                              onTap: () => onChange(
                                  currentCircularIndex > item.key
                                      ? item.key
                                      : item.key - 1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  item.value.icon,
                                  item.value.lebel == null
                                      ? const SizedBox.shrink()
                                      : Text(item.value.lebel ?? '',
                                          style: item.value.textStyle),
                                  const SizedBox(height: 3),
                                ],
                              ),
                            ),
                          ),
                        );
                }).toList(),
              ),
            ),
            //Center Item BtmNavBar
            Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () => centerItemClick(),
                child: CircleAvatar(
                  backgroundColor: cirularItemBorderColor ?? AppColors.white,
                  radius:
                      (cirularItemRadius ?? 25) + (cirularItemBorderWidth ?? 2),
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    radius: (cirularItemRadius ?? 25),
                    child: centerItem,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BtmNavItem {
  String? lebel;
  final Widget icon;
  TextStyle? textStyle;
  BtmNavItem({required this.icon, this.lebel, this.textStyle});
}

class ScaffoBtmNavBar {
  final List<BtmNavItem> itemTabs;
  final List<Widget> bodyItems;
  double? btmNavBarHeight;
  int currentIndex;
  Widget? circularWidgetItem;
  final Function centerItemClick;
  final Function(int) onChange;
  double? cirularItemRadius;
  Color? cirularItemBorderColor;
  double? cirularItemBorderWidth;
  Color? cirularItemColor;
  Color? btmNavBarColor;
  Decoration? btmNavBarDecoration;
  double? spacesInCenter;

  ScaffoBtmNavBar({
    required this.itemTabs,
    required this.bodyItems,
    this.btmNavBarHeight,
    this.currentIndex = -1,
    this.circularWidgetItem,
    required this.centerItemClick,
    this.cirularItemRadius,
    this.cirularItemBorderWidth,
    this.btmNavBarColor,
    this.btmNavBarDecoration,
    this.cirularItemBorderColor,
    this.cirularItemColor,
    required this.onChange,
    this.spacesInCenter,
  });
}
