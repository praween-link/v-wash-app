import 'package:appwash/viewmodel/app_home/booking/vehical_information_viewmodel.dart';
import 'package:appwash/routes/paths.dart';
import 'package:appwash/utils/constants/app_colors.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/common_widgets.dart';
import 'package:appwash/utils/widgets/scaffo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleInformationScreen extends StatelessWidget {
  VehicleInformationScreen({super.key});
  final VehicleInformationViewmodel vehicleInformationVm =
      Get.put(VehicleInformationViewmodel());
  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'Item-1',
      'Item-2',
      'Item-3',
      'Item-4',
      'Item-5',
    ];
    return Scaffo(
      appBar: AppBar(
        title: Text(
          "Select vehicle brand",
          style: TextStyles.normalText(context,
              fontWeight: FontWeight.w600, color: AppColors.white),
        ),
      ),
      bodyPadding: EdgeInsets.zero,
      appBarBottomChild: const SizedBox.shrink(),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: paddingV),
            _titleWidget(context, "Select Model"),
            const SizedBox(height: paddingVn),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingH),
              child: CommonWidgets.dropDown(
                context,
                items: items,
                selected: vehicleInformationVm.selectedBrand.value,
                onChange: (index) {
                  vehicleInformationVm.selectedBrand.value = index;
                },
              ),
            ),
            const SizedBox(height: paddingV),
            _titleWidget(context, "Vechicle Color"),
            const SizedBox(height: paddingVn),
            SizedBox(
              height: 50,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: vehicleInformationVm.vehicleColors.length + 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return index == 0
                      ? const SizedBox(width: paddingH)
                      : Padding(
                          padding: EdgeInsets.only(
                              right: index ==
                                      vehicleInformationVm.vehicleColors.length
                                  ? paddingH
                                  : paddingH / 2),
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.getColor(vehicleInformationVm
                                  .vehicleColors[index - 1]),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.5),
                                  width: 1),
                            ),
                          ),
                        );
                },
              ),
            ),
            const SizedBox(height: paddingV),
            _titleWidget(context, "Vechicle Number Plate"),
            const SizedBox(height: paddingVn),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingH),
              child: CommonWidgets.inputField(
                context,
                hint: "HP36D9867",
                controller: TextEditingController(),
                textInputType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: paddingV),
            _titleWidget(context, "Select Location"),
            const SizedBox(height: paddingVn),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingH),
              child: CommonWidgets.inputCardWidget(
                context,
                text: "SBP Homes Sector 117,Mohali, Punjab",
                onClick: () {
                  Get.toNamed(Routes.SELECT_A_LOCATION);
                },
                isHint: true,
                trailing: Icon(Icons.location_on, color: AppColors.blue),
              ),
            ),
            const SizedBox(height: paddingV),
            _titleWidget(context, "Select Apartments"),
            const SizedBox(height: paddingVn),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingH),
              child: CommonWidgets.dropDown(
                context,
                items: items,
                selected: vehicleInformationVm.selectedBrand.value,
                onChange: (index) {
                  vehicleInformationVm.selectedBrand.value = index;
                },
              ),
            ),
            const SizedBox(height: paddingV),
            _titleWidget(context, "Parking No."),
            const SizedBox(height: paddingVn),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingH),
              child: CommonWidgets.inputField(
                context,
                hint: "24B",
                controller: TextEditingController(),
                textInputType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: paddingV),
            const SizedBox(height: paddingV),
            CommonWidgets.button(
              context,
              margin: const EdgeInsets.symmetric(horizontal: paddingH),
              title: "Submit",
              onClick: () {
                print("Submit");
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding _titleWidget(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: paddingH),
      child: Text(title, style: TextStyles.inputFieldTitle(context)),
    );
  }
}
