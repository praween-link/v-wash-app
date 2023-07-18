import 'package:appwash/utils/widgets/image_view.dart';
import 'package:appwash/viewmodel/app_home/dashboard/rewards_viewmodel.dart';
import 'package:appwash/utils/constants/app_colors.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/common_widgets.dart';
import 'package:appwash/utils/widgets/scaffo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RewardsScreen extends StatelessWidget {
  RewardsScreen({super.key});

  final RewardsViewmodel rewardsVm = Get.put(RewardsViewmodel());

  @override
  Widget build(BuildContext context) {
    return Scaffo(
      appBarBottomChild: const SizedBox.shrink(),
      bodyPadding: EdgeInsets.zero,
      appBar: AppBar(
        title: Text("Rewards",
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
                      items: rewardsVm.sliderImages,
                      currentIndex: rewardsVm.currentSliderIndex.value,
                      onPageChanged: (index) {
                        rewardsVm.currentSliderIndex.value = index;
                      }),
                ),
              ),
              const SizedBox(height: paddingVn),

              ///
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingH),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: ImageView.view(
                            "https://i.pngimg.me/thumb/f/720/comdlpng6970124.jpg",
                            width: Get.width * 0.3,
                            fit: BoxFit.cover,
                            height: 75,
                          ),
                        ),
                        const SizedBox(width: paddingHn),
                        Flexible(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: paddingVn - 3),
                            Text(
                              "Brand Vouchers",
                              style: TextStyles.smallText(context,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: paddingVn),
                            Text(
                              "Up to 300 Cashback*",
                              style: TextStyles.smallText(context),
                            ),
                            const SizedBox(height: paddingVn),
                            Text(
                              "Lorem Ipsum is simply dummy text of ",
                              style:
                                  TextStyles.smallText(context, isGrey: true),
                            ),
                          ],
                        ))
                      ],
                    );
                  },
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: paddingVn),
                  itemCount: 5,
                ),
              ),
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
