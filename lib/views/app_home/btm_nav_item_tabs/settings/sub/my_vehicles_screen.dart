import 'package:appwash/utils/constants/app_colors.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/image_view.dart';
import 'package:appwash/utils/widgets/scaffo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyVehiclesScreen extends StatelessWidget {
  const MyVehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffo(
      appBar: AppBar(title: const Text("My Vehicles")),
      appBarBottomChild: const SizedBox.shrink(),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return myVehicleCard(
                context,
                padding: EdgeInsets.only(
                    bottom: paddingV, top: index == 0 ? paddingV : 0),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 0),
            itemCount: 5),
      ),
    );
  }

  Widget myVehicleCard(BuildContext context, {EdgeInsetsGeometry? padding}) =>
      Container(
        margin: padding,
        padding: const EdgeInsets.symmetric(
            horizontal: paddingHn, vertical: paddingVn),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.grey),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.3),
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
              style:
                  TextStyles.normalText(context, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: paddingVn / 2),
            Text(
              "HP36D5203",
              style: TextStyles.smallText(context),
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
      );
}
