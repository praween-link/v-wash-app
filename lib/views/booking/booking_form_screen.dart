import 'package:appwash/viewmodel/app_home/booking/booking_viewmodel.dart';
import 'package:appwash/routes/paths.dart';
import 'package:appwash/utils/constants/app_colors.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/common_widgets.dart';
import 'package:appwash/utils/widgets/scaffo.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});
  final BookingViewmodel bookingVm = Get.put(BookingViewmodel());
  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'Item-1',
      'Item-2',
      'Item-3',
      'Item-4',
      'Item-5',
    ];
    List<String> selectedDate = [
      "14 March",
      "14 March",
      "14 March",
      "14 March",
      "14 March",
      "14 March",
      "14 March",
      "14 March",
      "14 March",
      "14 March",
      "14 March",
      "14 March",
      "14 March",
      "14 March",
      "14 March",
      "14 March"
    ];
    return Scaffo(
      appBarBottomChild: const SizedBox.shrink(),
      bodyPadding: EdgeInsets.zero,
      appBar: AppBar(
        title: Text("Booking",
            style: TextStyles.normalText(context,
                fontWeight: FontWeight.w600, color: AppColors.white)),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: paddingV),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingH),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Select Vehicle",
                        style: TextStyles.inputFieldTitle(context)),
                    const SizedBox(height: paddingVn),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: CommonWidgets.dropDown(
                              context,
                              items: items,
                              selected: bookingVm.selectedVehicleIndex.value,
                              onChange: (index) {
                                bookingVm.selectedVehicleIndex.value = index;
                              },
                            ),
                          ),
                          const SizedBox(width: paddingHn),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.SELECT_VEHICLE_BRAND);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: paddingHn - 1,
                                  vertical: paddingVn - 1),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(Icons.add,
                                  size: 32, color: AppColors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: paddingV),

                    ///
                    Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: _radioTile(context,
                                  value: 2,
                                  selected:
                                      bookingVm.selectedProcessTypeIndex.value,
                                  title: "ScheduleOnce", onChange: (selected) {
                                bookingVm.selectedProcessTypeIndex.value =
                                    selected;
                              }),
                            ),
                          ],
                        ),
                        const SizedBox(height: paddingVn),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: _radioTile(context,
                                  value: 0,
                                  selected:
                                      bookingVm.selectedProcessTypeIndex.value,
                                  title: "OneTime", onChange: (selected) {
                                bookingVm.selectedProcessTypeIndex.value =
                                    selected;
                              }),
                            ),
                            Flexible(
                              flex: 2,
                              child: _radioTile(
                                context,
                                value: 1,
                                selected:
                                    bookingVm.selectedProcessTypeIndex.value,
                                title: "TimeTap",
                                subtitle: "Customize schedule",
                                onChange: (selected) {
                                  bookingVm.selectedProcessTypeIndex.value =
                                      selected;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: paddingV),
                  ],
                ),
              ),

              /// Wash Plan
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingH),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        bookingVm.selectedProcessTypeIndex.value == 2
                            ? "Choose Wash Plan"
                            : "Wash Plan",
                        style: TextStyles.inputFieldTitle(context)),
                    const SizedBox(height: paddingVn),
                    bookingVm.selectedProcessTypeIndex.value == 2
                        ? CommonWidgets.dropDown(
                            context,
                            items: items,
                            selected: bookingVm.selectedTimeSlotIndex.value,
                            onChange: (index) {
                              bookingVm.selectedTimeSlotIndex.value = index;
                            },
                          )
                        : CommonWidgets.washPlanCard(context,
                            amount: 60,
                            planValidity: "Day's",
                            contents: [
                                'Lorem Ipsum is simply dummy',
                                'Lorem Ipsum is simply dummy text of the',
                                'Lorem Ipsum is simply dummy'
                              ]),
                    const SizedBox(height: paddingV),
                  ],
                ),
              ),

              /// Select Date
              bookingVm.selectedProcessTypeIndex.value == 2
                  ? const SizedBox.shrink()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: paddingH),
                          child: Text("Select Date",
                              style: TextStyles.inputFieldTitle(context)),
                        ),
                        const SizedBox(height: paddingVn),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: paddingH),
                          child: CommonWidgets.inputCardWidget(context,
                              text: "DD-MM-YY", onClick: () {}, isHint: true),
                        ),
                        bookingVm.selectedProcessTypeIndex.value == 0
                            ? const SizedBox.shrink()
                            : SizedBox(
                                height: 28,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: selectedDate.length,
                                  itemBuilder: (context, index) => Container(
                                    margin: EdgeInsets.only(
                                        left: index == 0 ? paddingH : 0,
                                        right: index == selectedDate.length - 1
                                            ? paddingH
                                            : paddingHn,
                                        top: paddingVn),
                                    padding: const EdgeInsets.only(
                                        left: 5, top: 2, bottom: 2, right: 2),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Text(
                                          selectedDate[index],
                                          style: TextStyles.verySmallText(
                                              context,
                                              color: AppColors.white),
                                        ),
                                        const SizedBox(width: paddingHn - 4),
                                        CircleAvatar(
                                          radius: 7,
                                          backgroundColor: AppColors.red,
                                          child: const Icon(Icons.close,
                                              size: 8, color: AppColors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                        const SizedBox(height: paddingV),
                      ],
                    ),

              /// Start Date
              bookingVm.selectedProcessTypeIndex.value == 2
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: paddingH),
                          child: Text("Start Date",
                              style: TextStyles.inputFieldTitle(context)),
                        ),
                        const SizedBox(height: paddingVn),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: paddingH),
                          child: CommonWidgets.inputCardWidget(context,
                              text: "DD-MM-YY", onClick: () {}, isHint: true),
                        ),
                        const SizedBox(height: paddingV),
                      ],
                    )
                  : const SizedBox.shrink(),

              /// End Date
              bookingVm.selectedProcessTypeIndex.value == 2
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: paddingH),
                          child: Text("End Date",
                              style: TextStyles.inputFieldTitle(context)),
                        ),
                        const SizedBox(height: paddingVn),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: paddingH),
                          child: CommonWidgets.inputCardWidget(context,
                              text: "DD-MM-YY", onClick: () {}, isHint: true),
                        ),

                        const SizedBox(height: paddingV),
                      ],
                    )
                  : const SizedBox.shrink(),

              ///Choose Preferred TimeSlot
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingH),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Choose Preferred TimeSlot",
                        style: TextStyles.inputFieldTitle(context)),
                    const SizedBox(height: paddingVn),
                    CommonWidgets.dropDown(
                      context,
                      items: items,
                      selected: bookingVm.selectedTimeSlotIndex.value,
                      onChange: (index) {
                        bookingVm.selectedTimeSlotIndex.value = index;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: paddingV),

              ///
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingH),
                child: CommonWidgets.button(
                  context,
                  title: "Proceed to Pay \$60 ",
                  onClick: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _radioTile(context,
          {required String title,
          String? subtitle,
          required int selected,
          required int value,
          required Function(int) onChange}) =>
      InkWell(
        onTap: () {
          onChange(value);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              value: value,
              groupValue: selected,
              fillColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
              activeColor: Theme.of(context).primaryColor,
              autofocus: true,
              onChanged: (value) {
                onChange(value ?? -1);
              },
            ),
            const SizedBox(width: paddingHn),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: '$title ',
                  style: TextStyles.normalText(context,
                      color: Theme.of(context).textTheme.bodyMedium!.color),
                  children: <TextSpan>[
                    TextSpan(
                        text: subtitle ?? '',
                        style: TextStyles.verySmallText(context, isGrey: true)),
                  ],
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      );
}
