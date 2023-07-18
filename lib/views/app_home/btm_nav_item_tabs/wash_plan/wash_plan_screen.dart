import 'package:appwash/viewmodel/app_home/wash_plan/wash_plan_viewmodel.dart';
import 'package:appwash/utils/constants/app_colors.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/enums.dart';
import 'package:appwash/utils/images/icons_path.dart';
import 'package:appwash/utils/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WashPlanScreen extends StatelessWidget {
  WashPlanScreen({super.key});

  final WashPlanViewmodel washPlanVm = Get.put(WashPlanViewmodel());
  @override
  Widget build(BuildContext context) {
    List<String> plans = ['30A3A6', 'C1B24B', 'EA4C50'];
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: paddingH),
        child: Column(
          children: [
            const SizedBox(height: paddingV),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColors.grey),
              ),
              child: Obx(
                () => Row(
                  children: [
                    Expanded(
                        child: CommonWidgets.button(
                      context,
                      title: "Basic",
                      titleColor:
                          washPlanVm.washPlanType.value == WashPlan.BASIC
                              ? null
                              : AppColors.grey2,
                      color: washPlanVm.washPlanType.value == WashPlan.BASIC
                          ? null
                          : Theme.of(context).scaffoldBackgroundColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      onClick: () {
                        washPlanVm.washPlanType.value = WashPlan.BASIC;
                      },
                    )),
                    Expanded(
                        child: CommonWidgets.button(
                      context,
                      title: "Premium",
                      titleColor:
                          washPlanVm.washPlanType.value == WashPlan.PREMIUM
                              ? null
                              : AppColors.grey2,
                      color: washPlanVm.washPlanType.value == WashPlan.PREMIUM
                          ? null
                          : Theme.of(context).scaffoldBackgroundColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      onClick: () {
                        washPlanVm.washPlanType.value = WashPlan.PREMIUM;
                      },
                    )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: paddingV),

            ///
            ListView.separated(
              separatorBuilder: (_, __) => const SizedBox(height: paddingVn),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: plans.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => CommonWidgets.washPlanCard(
                    context,
                    isSelectable: true,
                    isSelected: washPlanVm.selected.value == index,
                    cardColor: AppColors.getColor(plans[index]),
                    amount: 60,
                    image: AppImages.carImg,
                    planValidity: "Day's",
                    contents: [
                      'Lorem Ipsum is simply dummy',
                      'Lorem Ipsum is simply dummy text of the',
                      'Lorem Ipsum is simply dummy'
                    ],
                    onClick: () {
                      washPlanVm.selected.value = index;
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: paddingV),

            ///
            CommonWidgets.button(
              context,
              title: "Choose Plan",
              onClick: () {},
            ),
            const SizedBox(height: paddingV),
          ],
        ),
      ),
    );
  }
}
