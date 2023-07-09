import 'package:appwash/routes/paths.dart';
import 'package:appwash/utils/constants/app_colors.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/images/icons_path.dart';
import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/theme/app_theme.dart';
import 'package:appwash/utils/widgets/common_widgets.dart';
import 'package:appwash/utils/widgets/scaffo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectVehicleBrandScreen extends StatelessWidget {
  const SelectVehicleBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffo(
      appBar: AppBar(
        title: Text("Select vehicle brand",
            style: TextStyles.normalText(context,
                fontWeight: FontWeight.w600, color: AppColors.white)),
      ),
      appBarBottomChild: CommonWidgets.searchField(
        context,
        hint: "Search by vehicle brand",
        margin: const EdgeInsets.only(
            left: paddingH, right: paddingH, bottom: paddingV),
        onChanged: (text) {},
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: paddingV),
          child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 50,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: paddingHn,
                  mainAxisSpacing: paddingHn,
                  childAspectRatio: MediaQuery.of(context).size.width * 0.0036),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Material(
                    color: AppColors.transparent,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.VEHICLE_INFORMATION);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(paddingHn),
                        decoration: BoxDecoration(
                          // color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.grey),
                        ),
                        child: Image.asset(AppIcons.authLogo),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
