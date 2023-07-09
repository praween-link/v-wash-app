import 'package:appwash/utils/constants/app_colors.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/common_widgets.dart';
import 'package:appwash/utils/widgets/scaffo.dart';
import 'package:flutter/material.dart';

class SelectLocationScreen extends StatelessWidget {
  const SelectLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffo(
      bodyPadding: EdgeInsets.zero,
      appBar: AppBar(
        title: Text("Select a Location",
            style: TextStyles.normalText(context,
                fontWeight: FontWeight.w600, color: AppColors.white)),
      ),
      appBarBottomChild: CommonWidgets.searchField(
        context,
        hint: "Search by Search for area,streer name brand",
        margin: const EdgeInsets.only(
            left: paddingH, right: paddingH, bottom: paddingV),
        onChanged: (text) {},
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: paddingV),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return index == 0
                  ? suggestionLocationTile(
                      context,
                      title: "Use Current location",
                      subTitle: "SBP Homes Sector 117,Mohali, Punjab",
                      onClick: () {},
                      leading: Icon(Icons.my_location,
                          color: Theme.of(context).primaryColor),
                      titleColor: Theme.of(context).primaryColor,
                    )
                  : suggestionLocationTile(
                      context,
                      title: "74 Sector A",
                      subTitle: "SBP Homes Sector 117,Mohali, Punjab",
                      onClick: () {},
                    );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: 10,
          ),
        ),
      ),
    );
  }

  Widget suggestionLocationTile(BuildContext context,
      {required String title,
      required String subTitle,
      Widget? leading,
      required Function onClick,
      Color? titleColor}) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: () => onClick(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: paddingVn, horizontal: paddingH),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              leading ??
                  Icon(Icons.location_on,
                      color: AppColors.grey.withOpacity(0.5)),
              const SizedBox(width: paddingHn),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyles.normalText(context, color: titleColor),
                  ),
                  Text(
                    subTitle,
                    style: TextStyles.smallText(context, isGrey: true),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
