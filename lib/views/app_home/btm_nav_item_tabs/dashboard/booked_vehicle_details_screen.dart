import 'package:appwash/viewmodel/app_home/dashboard/rewards_viewmodel.dart';
import 'package:appwash/utils/constants/app_colors.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/enums.dart';
import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/common_widgets.dart';
import 'package:appwash/utils/widgets/scaffo.dart';
import 'package:appwash/views/common_views/calender_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookedDetailsScreen extends StatelessWidget {
  BookedDetailsScreen({super.key});

  final RewardsViewmodel rewardsVm = Get.put(RewardsViewmodel());

  @override
  Widget build(BuildContext context) {
    return Scaffo(
      appBarBottomChild: const SizedBox.shrink(),
      bodyPadding: EdgeInsets.zero,
      appBar: AppBar(
        title: Text("Details",
            style: TextStyles.normalText(context,
                fontWeight: FontWeight.w600, color: AppColors.white)),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: paddingV),
          child: Column(
            children: [
              const SizedBox(height: paddingV),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: paddingH),
                padding: const EdgeInsets.symmetric(
                    horizontal: paddingHn, vertical: paddingVn),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.grey),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Theme.of(context)
                            .colorScheme
                            .shadow
                            .withOpacity(0.3),
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: Image.network(
                            'https://images.pexels.com/photos/120049/pexels-photo-120049.jpeg'),
                      ),
                    ),
                    const SizedBox(height: paddingVn),
                    Text(
                      "Honda Amaze",
                      style: TextStyles.normalText(context,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: paddingVn / 2),
                    Text(
                      "HP36D5203",
                      style: TextStyles.smallText(context),
                    ),
                    const SizedBox(height: paddingVn / 2),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: FontSizes.normal,
                        ),
                        const SizedBox(width: paddingHn / 2),
                        InkWell(
                          onTap: () {
                            Get.to(() => const DynamicEvent());
                          },
                          child: Text(
                            false
                                ? "22 Sep 2022 - 12 Oct 2022"
                                : "View Scheduled Date’s",
                            style: TextStyles.smallText(context,
                                color: false
                                    ? null
                                    : Theme.of(context).primaryColor),
                            // maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: paddingVn / 2),
                    Text(
                      "Preferred TimeSlot  9:00 AM - 10:00 AM",
                      style: TextStyles.verySmallText(context, isGrey: true),
                    ),
                    const SizedBox(height: paddingVn / 2),
                    Text(
                      "₹ 52.05",
                      style: TextStyles.normalText(context,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: paddingVn),
                    const Divider(),
                    const SizedBox(height: paddingV),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(Icons.location_on_rounded,
                            color: AppColors.blue, size: 18),
                        const SizedBox(width: paddingHn),
                        Text("SBP Homes Sector 117,Mohali, Punjab",
                            style: TextStyles.verySmallText(context)),
                      ],
                    ),
                  ],
                ),
              ),
              //
              const SizedBox(height: paddingV),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingH),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   "Today Scheduled",
                      //   style: TextStyles.mediumText(context,
                      //       fontWeight: FontWeight.w600),
                      // ),
                      // const SizedBox(height: paddingVn),
                      // //

                      // _scheduledTile(context,
                      //     todayIsActive: false,
                      //     scheduleStatus: ScheduleStatus.PROGRESS),
                      // const SizedBox(height: paddingVn),

                      Text(
                        "Booking Scheduled",
                        style: TextStyles.mediumText(context,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: paddingVn),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => _scheduledTile(
                              context,
                              scheduleStatus: ScheduleStatus.PROGRESS),
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: paddingVn),
                          itemCount: 5),
                      const SizedBox(height: paddingVn),
                    ],
                  ),
                ),
              ),
              //
            ],
          ),
        ),
      ),
    );
  }

  //
  Widget _scheduledTile(context,
          {bool todayIsActive = false,
          ScheduleStatus scheduleStatus = ScheduleStatus.UPCOMING}) =>
      Container(
        padding: const EdgeInsets.symmetric(
            horizontal: paddingHn, vertical: paddingVn),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: todayIsActive ? Theme.of(context).primaryColor : null,
          border: Border.all(
              color: Theme.of(context).primaryColor.withOpacity(0.2)),
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
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_month, size: 20),
                      const SizedBox(width: paddingHn),
                      Expanded(
                        child: Text(
                          "03 Sep 2022",
                          style: TextStyles.normalText(context,
                              color: todayIsActive ? AppColors.white : null),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: paddingH + 8),
                    child: RichText(
                      text: TextSpan(
                        text: 'Asigned: ',
                        style: TextStyles.verySmallText(context,
                            fontStyle: FontStyle.italic, isGrey: true),
                        children: <TextSpan>[
                          TextSpan(
                              text: "John | 08AM - 09AM",
                              style: TextStyles.verySmallText(context,
                                  isGrey: true, fontStyle: FontStyle.normal)),
                        ],
                      ),
                      maxLines: 2,
                    ),
                  ),
                  todayIsActive
                      ? const SizedBox.shrink()
                      : const SizedBox(height: 3),
                  todayIsActive
                      ? const SizedBox.shrink()
                      : scheduleStatus == ScheduleStatus.COMPLETED
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(left: paddingH + 8),
                              child: CommonWidgets.rateWidget(4),
                            )
                          : const SizedBox.shrink(),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  scheduleStatus == ScheduleStatus.COMPLETED
                      ? "Completed"
                      : scheduleStatus == ScheduleStatus.PROGRESS
                          ? "In Progress"
                          : "Upcoming",
                  style: TextStyles.smallText(context,
                      color: todayIsActive
                          ? AppColors.white
                          : scheduleStatus == ScheduleStatus.COMPLETED
                              ? AppColors.green
                              : scheduleStatus == ScheduleStatus.PROGRESS
                                  ? AppColors.orange
                                  : AppColors.blue),
                ),
                scheduleStatus == ScheduleStatus.COMPLETED
                    ? Text(
                        "10:30PM",
                        style: TextStyles.veryVerySmallText(context,
                            color: AppColors.orange),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      );
}
