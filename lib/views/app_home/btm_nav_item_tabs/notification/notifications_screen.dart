import 'package:appwash/utils/constants/app_colors.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/common_widgets.dart';
import 'package:appwash/viewmodel/app_home/dashboard/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final DashboardViewmodel dashboardVm = Get.put(DashboardViewmodel());

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
                  items: dashboardVm.sliderImages,
                  currentIndex: dashboardVm.currentSliderIndex.value,
                  onPageChanged: (index) {
                    dashboardVm.currentSliderIndex.value = index;
                  }),
            ),
          ),
          const SizedBox(height: paddingVn),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 50,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              int length = 50;
              return Container(
                margin: EdgeInsets.only(
                    left: paddingH,
                    right: paddingH,
                    top: index == 0 ? paddingV : paddingVn,
                    bottom: index == length - 1 ? paddingV : 0),
                padding: const EdgeInsets.symmetric(
                    horizontal: paddingHn, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.grey),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon(
                    //   Icons.notifications,
                    //   color: Theme.of(context).primaryColor,
                    // ),
                    // const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
                              style: TextStyles.verySmallText(context,
                                  height: 1.3),
                              maxLines: 3),
                          const SizedBox(height: paddingVn),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "01 Sep 2022 ",
                                style: TextStyles.verySmallText(context,
                                    color: AppColors.grey2),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        // AppDialogs.confirm(
                        //   context,
                        //   confirm: () {},
                        //   bodyText: "Are you sure to delete this notification.",
                        // );
                      },
                      child: Icon(
                        Icons.more_vert,
                        color: AppColors.grey.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
