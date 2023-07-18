import 'package:appwash/viewmodel/app_home/dashboard/appwash_wallet_viewmodel.dart';
import 'package:appwash/utils/constants/app_colors.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/common_widgets.dart';
import 'package:appwash/utils/widgets/scaffo.dart';
import 'package:appwash/views/app_home/btm_nav_item_tabs/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppWashWalletScreen extends StatelessWidget {
  AppWashWalletScreen({super.key});

  final AppwashWalletViewmodel appwashWalletVm =
      Get.put(AppwashWalletViewmodel());

  @override
  Widget build(BuildContext context) {
    return Scaffo(
      appBarBottomChild: const SizedBox.shrink(),
      bodyPadding: EdgeInsets.zero,
      appBar: AppBar(
        title: Text("appwash Wallet",
            style: TextStyles.normalText(context,
                fontWeight: FontWeight.w600, color: AppColors.white)),
      ),
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingH),
                child: Obx(
                  () => CommonWidgets.appImageSlider(
                      items: appwashWalletVm.sliderImages,
                      currentIndex: appwashWalletVm.currentSliderIndex.value,
                      onPageChanged: (index) {
                        appwashWalletVm.currentSliderIndex.value = index;
                      }),
                ),
              ),
              const SizedBox(height: paddingV),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: paddingH),
                padding: const EdgeInsets.symmetric(
                    horizontal: paddingHn, vertical: paddingVn),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.grey),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Theme.of(context).colorScheme.shadow,
                        offset: const Offset(1, 5),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ]),
                child: Column(
                  children: [
                    const SizedBox(height: paddingVn),
                    Text(
                      "appwash Wallet Balance",
                      style: TextStyles.mediumText(context,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "₹1000.00",
                      style: TextStyles.largText(context,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).primaryColor,
                          fontSize: 22),
                    ),
                    const SizedBox(height: paddingVn),
                    const Divider(),
                    const SizedBox(height: paddingV),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Topup Wallet",
                            style: TextStyles.mediumText(context),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: paddingVn),
                          CommonWidgets.inputField(
                            context,
                            hint: "Enter Amount",
                            controller: TextEditingController(),
                            textInputType: TextInputType.number,
                          ),
                          const SizedBox(height: paddingV),
                          CommonWidgets.button(
                            context,
                            title: "Proceed to Topup",
                            onClick: () {
                              print("Submit");
                            },
                          ),
                          const SizedBox(height: paddingVn),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //
              const SizedBox(height: paddingV),
              WidgetSettings.settingTile(context,
                  title: "Appwash Wallet Transaction Histories", onClick: () {
                //
              }),
            ],
          )),
    );
  }
}

class _WidgetSettings {
  static Widget bookingHistoryCard(context,
          {required String title, required Function onClick}) =>
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
              BoxShadow(color: Theme.of(context).primaryColor),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bajaj Pulser 220",
                      style: TextStyles.smallText(context,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "HP36D5203",
                      style: TextStyles.smallText(context),
                    ),
                    Text(
                      "22 Sep 2022 - 12 Oct 2022",
                      style: TextStyles.smallText(context),
                    ),
                    Text(
                      "Preferred TimeSlot  9:00 AM - 10:00 AM ",
                      style:
                          TextStyles.veryVerySmallText(context, isGrey: true),
                    ),
                    Text(
                      "Booking ID: 126545",
                      style: TextStyles.smallText(context),
                    ),
                    Text(
                      "Booking Date & Time: 22 Sep 2022 , 9:00 AM",
                      style: TextStyles.smallText(context),
                    ),
                    Text(
                      "Assigned to: Ashwani Thakur",
                      style: TextStyles.smallText(context),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text("Completed",
                      style: TextStyles.normalText(context,
                          color: Theme.of(context).primaryColor)),
                  Text("10:00 AM",
                      style:
                          TextStyles.veryVerySmallText(context, isGrey: true)),
                ],
              ),
            ],
          ),
        ),
      );
}
