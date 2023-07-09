import 'package:appwash/viewmodel/app_home/dashboard/dashboard_viewmodel.dart';
import 'package:appwash/routes/paths.dart';
import 'package:appwash/utils/constants/app_colors.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/images/icons_path.dart';
import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget with _WidgetsDashboard {
  DashboardScreen({super.key});

  final DashboardViewmodel dashboardVm = Get.put(DashboardViewmodel());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
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
            SizedBox(
              height: 75,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: dashboardVm.dashCatForUser.length + 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return index == 0
                      ? const SizedBox(width: paddingH)
                      : Padding(
                          padding: EdgeInsets.only(
                              right: index == dashboardVm.dashCatForUser.length
                                  ? paddingH
                                  : paddingH / 2),
                          child: _WidgetsDashboard.dashCatCard(
                            context,
                            title: dashboardVm.dashCatForUser[index - 1].title,
                            assetIcon:
                                dashboardVm.dashCatForUser[index - 1].assetIcon,
                            onClick: () => index == 1
                                ? Get.toNamed(Routes.APPWASH_WALLET)
                                : index == 2
                                    ? Get.toNamed(Routes.REWARDS)
                                    : Get.toNamed(Routes.REFER_EARN),
                          ),
                        );
                },
              ),
            ),
            const SizedBox(height: paddingV),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingH),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Bookings",
                      style: TextStyles.mediumText(context,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: paddingV),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: HomeDummyData.myBookings.length,
                itemBuilder: (context, index) {
                  MyBooking myBooking = HomeDummyData.myBookings[index];
                  return _WidgetsDashboard.bookingCard(context,
                      title: myBooking.title ?? '',
                      address: myBooking.bookedDuration ?? '',
                      vachicleNumber: myBooking.vehicleId ?? '',
                      price: myBooking.price ?? 0,
                      onViewClick: () {},
                      singleBooking: myBooking.singleBooking,
                      img:
                          'https://4.imimg.com/data4/ET/SK/MY-12606593/bike-washing-service-500x500.jpg');
                })
          ],
        ),
      ),
    );
  }
}

mixin _WidgetsDashboard {
  static Widget dashCatCard(context,
          {required String title,
          required String assetIcon,
          required Function onClick}) =>
      InkWellContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(assetIcon, height: 28, width: 28),
            const SizedBox(height: 5),
            Text(
              title,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyles.verySmallText(context, color: AppColors.white),
            )
          ],
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: paddingHn, vertical: paddingVn),
        color: Theme.of(context).primaryColor,
        onClick: () => onClick(),
        width: 125,
        outerBorderRadius: BorderRadius.circular(8),
      );

  static Widget bookingCard(context,
          {required String img,
          required String title,
          required String address,
          required String vachicleNumber,
          required double price,
          bool singleBooking = true,
          required Function onViewClick}) =>
      Stack(
        children: [
          Container(
            height: 110,
            margin: const EdgeInsets.only(
                left: paddingH, right: paddingH, bottom: paddingH),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.grey),
            ),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                  width: 120,
                  height: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: FadeInImage(
                      image: NetworkImage(img),
                      placeholder: AssetImage(AppImages.placeholderImg),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: paddingHn),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: paddingVn),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyles.normalText(context,
                            fontWeight: FontWeight.w600),
                        maxLines: 1,
                      ),
                      const SizedBox(height: paddingVn / 2),
                      Text(
                        vachicleNumber,
                        style: TextStyles.smallText(context),
                        maxLines: 1,
                      ),
                      const SizedBox(height: paddingVn / 2),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            size: FontSizes.normal,
                          ),
                          const SizedBox(width: paddingHn / 2),
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                !singleBooking
                                    ? address
                                    : "View Scheduled Date’s",
                                style: TextStyles.smallText(context,
                                    color: !singleBooking
                                        ? null
                                        : Theme.of(context).primaryColor),
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: paddingVn / 2),
                      Text(
                        "₹ $price",
                        style: TextStyles.mediumText(context,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600),
                        maxLines: 1,
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          Positioned(
            bottom: paddingV,
            right: paddingH,
            child: InkWellContainer(
              child: Text(
                "View More",
                style: TextStyles.smallText(context, color: AppColors.white),
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: paddingHn, vertical: 5),
              color: Theme.of(context).primaryColor,
              onClick: () {
                Get.toNamed(Routes.BOOKED_DETAILS);
              },
              outerBorderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
          ),
        ],
      );
}
