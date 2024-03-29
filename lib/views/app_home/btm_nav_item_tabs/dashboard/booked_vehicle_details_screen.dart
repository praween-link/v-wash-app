import 'package:appwash/utils/images/icons_path.dart';
import 'package:appwash/utils/widgets/dialogs/dialogs.dart';
import 'package:appwash/utils/widgets/image_view.dart';
import 'package:appwash/viewmodel/app_home/dashboard/rewards_viewmodel.dart';
import 'package:appwash/utils/constants/app_colors.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/enums.dart';
import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/common_widgets.dart';
import 'package:appwash/utils/widgets/scaffo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
                        // color: Colors.grey.shade200,
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: ImageView.view(
                            'https://images.pexels.com/photos/120049/pexels-photo-120049.jpeg',
                            width: Get.width * 0.5,
                            fit: BoxFit.cover),
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
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: paddingHn / 2),
                        InkWell(
                          onTap: () {
                            // Get.to(() => const DynamicEvent());
                            Get.dialog(
                              Center(
                                child: Wrap(
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 14, vertical: 14),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              width: 0.5),
                                        ),
                                        child: SfDateRangePicker(
                                          showNavigationArrow: true,
                                          initialSelectedDates: [
                                            DateTime(2023, 7, 13),
                                            DateTime(2023, 7, 14),
                                            DateTime(2023, 7, 15),
                                            DateTime(2023, 7, 19),
                                            DateTime(2023, 7, 21),
                                          ],
                                          onSelectionChanged: null,
                                          selectionMode:
                                              DateRangePickerSelectionMode
                                                  .multiple,
                                          //
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
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
                      "₹52.05",
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
                      Text(
                        "Today Scheduled",
                        style: TextStyles.mediumText(context,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: paddingVn),
                      //

                      _scheduledTile(context,
                          todayIsActive: false,
                          scheduleStatus: ScheduleStatus.NONE,
                          onClick: () {}),
                      const SizedBox(height: paddingVn),

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
                                  scheduleStatus: index % 2 == 0
                                      ? ScheduleStatus.COMPLETED
                                      : ScheduleStatus.COMPLETED_RATED,
                                  onClick: () {}, rateNow: () {
                                AppDialogs.show(context,
                                    barrierDismissible: false,
                                    child: reviewWidget(context),
                                    confirm: null);
                              }),
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: paddingVn),
                          itemCount: 10),
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

  Stack reviewWidget(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Image.asset(
              AppIcons.appLogo,
              height: 80,
              width: 80,
            ),
            const Text("Your opinion matter to us!"),
            const SizedBox(height: paddingVn),
            CommonWidgets.rateWidget(4),
            const SizedBox(height: paddingV),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidgets.inputField(
                  context,
                  title: "Write a Review",
                  hint: "Write a review...",
                  textInputType: TextInputType.name,
                  maxLength: 500,
                  maxLines: 5,
                  onChanged: (text) {
                    //
                  },
                ),
                const SizedBox(height: paddingVn),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
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
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.camera_alt_rounded,
                        size: 26,
                      ),
                      Text(
                        "Upload image",
                        style: TextStyles.veryVerySmallText(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: paddingV),
            CommonWidgets.button(
              context,
              onClick: () {
                Get.back();
              },
            ),
            const SizedBox(height: paddingVn),
          ],
        ),
        //
        Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: () => Get.back(),
              child: const SizedBox(child: Icon(Icons.close)),
            ))
      ],
    );
  }

  //
  Widget _scheduledTile(context,
          {bool todayIsActive = false,
          ScheduleStatus scheduleStatus = ScheduleStatus.UPCOMING,
          required Function onClick,
          Function? rateNow}) =>
      GestureDetector(
        onTap: () => onClick(),
        child: Stack(
          children: [
            Container(
              height: [ScheduleStatus.COMPLETED, ScheduleStatus.COMPLETED_RATED]
                      .contains(scheduleStatus)
                  ? 75
                  : 55,
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
                                    color:
                                        todayIsActive ? AppColors.white : null),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: paddingH + 8),
                          child: RichText(
                            text: TextSpan(
                              text: 'Preferred TimeSlot  9:00 AM - 10:00 AM',
                              style: TextStyles.verySmallText(context,
                                  isGrey: true),
                              // children: <TextSpan>[
                              //   TextSpan(
                              //       text: "John | 08AM - 09AM",
                              //       style: TextStyles.verySmallText(context,
                              //           isGrey: true, fontStyle: FontStyle.normal)),
                              // ],
                            ),
                            maxLines: 2,
                          ),
                        ),
                        todayIsActive
                            ? const SizedBox.shrink()
                            : const SizedBox(height: 3),
                        todayIsActive
                            ? const SizedBox.shrink()
                            : [
                                ScheduleStatus.COMPLETED,
                                ScheduleStatus.COMPLETED_RATED
                              ].contains(scheduleStatus)
                                ? scheduleStatus ==
                                        ScheduleStatus.COMPLETED_RATED
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            left: paddingH + 8),
                                        child: CommonWidgets.rateWidget(4),
                                      )
                                    : InkWell(
                                        onTap: rateNow == null
                                            ? () {}
                                            : () => rateNow(),
                                        child: Text(
                                          "Rate us!",
                                          style: TextStyles.normalText(context,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                          maxLines: 1,
                                        ),
                                      )
                                : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  scheduleStatus == ScheduleStatus.NONE
                      ? const SizedBox.shrink()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(),
                            Text(
                              [
                                ScheduleStatus.COMPLETED,
                                ScheduleStatus.COMPLETED_RATED
                              ].contains(scheduleStatus)
                                  ? "Completed"
                                  : scheduleStatus == ScheduleStatus.PROGRESS
                                      ? "In Progress"
                                      : "Upcoming",
                              style: TextStyles.smallText(context,
                                  color: todayIsActive
                                      ? AppColors.white
                                      : [
                                          ScheduleStatus.COMPLETED,
                                          ScheduleStatus.COMPLETED_RATED
                                        ].contains(scheduleStatus)
                                          ? AppColors.green
                                          : scheduleStatus ==
                                                  ScheduleStatus.PROGRESS
                                              ? AppColors.orange
                                              : AppColors.blue),
                            ),
                            // scheduleStatus == ScheduleStatus.COMPLETED
                            //     ? Text(
                            //         "10:30PM",
                            //         style: TextStyles.veryVerySmallText(context,
                            //             color: AppColors.orange),
                            //       )
                            //     : const SizedBox.shrink(),
                          ],
                        ),
                ],
              ),
            ),
            [ScheduleStatus.COMPLETED, ScheduleStatus.COMPLETED_RATED]
                    .contains(scheduleStatus)
                ? Positioned(
                    top: 3,
                    right: 3,
                    child: GestureDetector(
                      onTap: () {
                        bottomSheet(context);
                      },
                      child: const SizedBox(
                        child: Icon(
                          Icons.more_vert,
                          size: 22,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      );

  ///
  bottomSheet(BuildContext context) => showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 10,
        builder: (BuildContext context) {
          return Wrap(
            children: [
              Column(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                        AppDialogs.show(context,
                            barrierDismissible: false,
                            child: reviewWidget(context),
                            confirm: null);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14, vertical: 14 + paddingVn),
                        child: Row(
                          children: [
                            Expanded(child: Text("Edit Rate")),
                            Icon(Icons.edit, size: 18),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(height: paddingVn),
                ],
              ),
            ],
          );
        },
      );
}
