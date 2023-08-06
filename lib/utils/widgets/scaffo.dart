import 'package:appwash/utils/constants/app_colors.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/images/icons_path.dart';
import 'package:appwash/utils/widgets/customs/drawer.dart';
import 'package:flutter/material.dart';

import 'image_view.dart';

BoxDecoration scaffoBodyDecoration(context, {Color? backgroundColor}) =>
    BoxDecoration(
      color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
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
    this.backgroundColor,
  });
  final Widget child;
  Widget? appBarBottomChild;
  PreferredSizeWidget? appBar;
  EdgeInsetsGeometry? bodyPadding;
  ScaffoBtmNavBar? scaffoBtmNavBar;
  bool appDrawerOpen;
  Widget? appDrawer;
  Color? backgroundColor;

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
                                  child: ImageView.assetView(AppIcons.appLogo,
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
                                  decoration: scaffoBodyDecoration(context,
                                      backgroundColor: backgroundColor),
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
                    selectedItem: scaffoBtmNavBar!.selectedItem,
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
                    selectedColor: scaffoBtmNavBar!.selectedColor,
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
    int selectedItem = 0,
    Color? selectedColor,
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
                  // print(
                  //     "selectedItem: $selectedItem, currentCircularIndex: $currentCircularIndex, item: ${(selectedItem == currentCircularIndex ? item.key + 1 : item.key)}");
                  if (item.value.lebel == 'hiden_circule') {
                    return CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: (cirularItemRadius ?? 25) /
                            (spacesInCenter ?? 1.5));
                  } else {
                    return Flexible(
                      flex: 1,
                      child: Center(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => onChange(
                                currentCircularIndex > item.key
                                    ? item.key
                                    : item.key - 1),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                (selectedItem >= currentCircularIndex
                                            ? selectedItem + 1
                                            : selectedItem) ==
                                        item.key
                                    ? Container(
                                        height: btmNavBarHeight ?? 50,
                                        // width: btmNavBarHeight ?? 50,
                                        decoration: BoxDecoration(
                                            color: selectedColor ??
                                                Colors.white.withOpacity(0.1),
                                            // shape: BoxShape.circle
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(12))),
                                      )
                                    : const SizedBox.shrink(),
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
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
  int selectedItem;
  Color? selectedColor;

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
    this.selectedItem = 0,
    this.selectedColor,
  });
}
