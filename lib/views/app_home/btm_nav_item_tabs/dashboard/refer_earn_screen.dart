import 'package:appwash/viewmodel/app_home/dashboard/rewards_viewmodel.dart';
import 'package:appwash/utils/constants/app_colors.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/scaffo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReferEarnScreen extends StatelessWidget {
  ReferEarnScreen({super.key});

  final RewardsViewmodel rewardsVm = Get.put(RewardsViewmodel());

  @override
  Widget build(BuildContext context) {
    return Scaffo(
      appBarBottomChild: const SizedBox.shrink(),
      bodyPadding: EdgeInsets.zero,
      appBar: AppBar(
        title: Text("Refer & Earn",
            style: TextStyles.normalText(context,
                fontWeight: FontWeight.w600, color: AppColors.white)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: paddingV),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: paddingV * 2),
                      Text(
                        "Earn \$ 100!",
                        style: TextStyles.largText(context,
                            fontSize: 22, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        '''Invite your friend to appwash\nGet \$100 cashback!\nwhen they do their first booking using appwash''',
                        style: TextStyles.smallText(context),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: paddingV * 2),
                    ],
                  ),
                  //
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45),
                        ),
                      ),
                      width: double.infinity,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: paddingV),
                            Text(
                              "Invite",
                              style: TextStyles.mediumText(context,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: paddingV),
                            SizedBox(
                              width: double.infinity,
                              height: 100,
                              child: Center(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: 4,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: index == 0 ? paddingH : 0,
                                          right: paddingH),
                                      child: Column(
                                        children: [
                                          const CircleAvatar(radius: 26),
                                          const SizedBox(height: paddingVn - 6),
                                          Text(
                                            "Whatsapp",
                                            style:
                                                TextStyles.smallText(context),
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: paddingHn),
                              child: Divider(),
                            ),
                            const SizedBox(height: paddingV),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: paddingH),
                                child: Text(
                                  "Suggested Contacts",
                                  style: TextStyles.normalText(context),
                                ),
                              ),
                            ),
                            const SizedBox(height: paddingVn),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 15,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                              ),
                              // childAspectRatio:
                              //     MediaQuery.of(context).size.width *
                              //         0.001),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 28,
                                      child: Text(
                                        "PK",
                                        style: TextStyles.largText(context,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    const SizedBox(height: paddingVn - 6),
                                    Text(
                                      "Praween Kr.",
                                      style: TextStyles.smallText(context),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "Invite".toUpperCase(),
                                      style: TextStyles.verySmallText(context,
                                          color:
                                              Theme.of(context).primaryColor),
                                      maxLines: 1,
                                    ),
                                  ],
                                );
                              },
                            ),
                            const SizedBox(height: paddingV),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
