import 'package:appwash/utils/constants/app_colors.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/enums.dart';
import 'package:appwash/utils/images/icons_path.dart';
import 'package:appwash/utils/styles/text_styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'customs/drop_down.dart';

class CommonWidgets {
  //
  static Widget rateWidget(int rate) => Wrap(
        children: List.generate(
          5,
          (index) => Icon(Icons.star,
              color: index < rate ? AppColors.orange : AppColors.grey,
              size: 18),
        ),
      );

  /// Button
  static Widget button(context,
          {String? title,
          Widget? child,
          required Function onClick,
          Color? color,
          Color? titleColor,
          EdgeInsetsGeometry? margin,
          EdgeInsetsGeometry? padding,
          bool withBorder = false}) =>
      Padding(
        padding: margin ?? EdgeInsets.zero,
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            width: double.infinity,
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
                color: withBorder
                    ? Colors.transparent
                    : color ?? Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(5),
                border: withBorder
                    ? Border.all(color: color ?? Theme.of(context).primaryColor)
                    : null),
            child: child ??
                Text(
                  title ?? 'Submit',
                  style: TextStyles.buttonText(context, color: titleColor),
                  textAlign: TextAlign.center,
                ),
          ),
        ),
      );

  /// Input Field
  static Widget inputField(context,
          {String? title,
          String? hint,
          TextEditingController? controller,
          Function(String)? onChanged,
          bool isPhoneInput = false,
          int? maxLength,
          TextInputAction? textInputAction,
          TextAlign? textAlign,
          TextInputType? textInputType,
          String? counterText,
          String? validationMsg,
          ValidationStatus validationStatus = ValidationStatus.NONE,
          List<TextInputFormatter>? inputFormatters}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title == null
              ? const SizedBox.shrink()
              : Text(
                  title,
                  style: TextStyles.inputFieldTitle(context),
                ),
          title == null
              ? const SizedBox.shrink()
              : const SizedBox(height: paddingVn),
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Builder(
                  builder: (context) => !isPhoneInput
                      ? const SizedBox.shrink()
                      : RichText(
                          text: TextSpan(
                            text: '   🇮🇳',
                            style: TextStyles.normalText(context),
                            children: <TextSpan>[
                              const TextSpan(text: ' +91 '),
                              TextSpan(
                                  text: '| ',
                                  style: TextStyles.normalText(context,
                                      isGrey: true)),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        )),
              TextField(
                maxLength: maxLength,
                controller: controller,
                onChanged: onChanged,
                style: TextStyles.normalText(context),
                textInputAction: textInputAction,
                textAlign: textAlign ?? TextAlign.start,
                keyboardType: textInputType,
                inputFormatters: inputFormatters,
                decoration: InputDecoration(
                  counterText: counterText ?? '',
                  prefix: !isPhoneInput
                      ? null
                      : RichText(
                          text: TextSpan(
                            text: '🇮🇳',
                            style: TextStyles.normalText(context,
                                color: Colors.transparent),
                            children: <TextSpan>[
                              const TextSpan(text: ' +91 '),
                              TextSpan(
                                  text: '| ',
                                  style: TextStyles.normalText(context,
                                      isGrey: true, color: Colors.transparent)),
                            ],
                          ),
                        ),
                  hintText: hint,
                  hintStyle: TextStyles.normalText(context, isGrey: true),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.5, color: AppColors.greyNormal),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1.5, color: Theme.of(context).primaryColor),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
            ],
          ),
          validationStatus == ValidationStatus.NONE
              ? const SizedBox.shrink()
              : Text(
                  validationStatus == ValidationStatus.EMPTY
                      ? "$title can't be empty."
                      : validationStatus == ValidationStatus.OTHER
                          ? validationMsg ?? ''
                          : validationStatus == ValidationStatus.GOOD_JOB
                              ? "Good job."
                              : '',
                  style: TextStyle(
                      fontSize: FontSizes.textVeryVerySmall,
                      color: validationStatus == ValidationStatus.GOOD_JOB
                          ? AppColors.green
                          : AppColors.red),
                ),
        ],
      );

  ///
  /// Search Field
  static Widget searchField(
    context, {
    String? hint,
    EdgeInsetsGeometry? margin,
    required Function(String) onChanged,
  }) =>
      Padding(
        padding: margin ?? EdgeInsets.zero,
        child: TextField(
          onChanged: (value) => onChanged(value),
          controller: TextEditingController(text: ''),
          textInputAction: TextInputAction.search,
          // textCapitalization: TextCapitalization.sentences,
          style: TextStyles.normalText(context),
          textAlignVertical: TextAlignVertical.center,
          cursorColor: Colors.white,
          showCursor: true,
          mouseCursor: MouseCursor.uncontrolled,
          decoration: InputDecoration(
            filled: true,
            prefixIcon:
                const Icon(Icons.search, color: Colors.white70, size: 18),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(45),
                gapPadding: 0),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(45),
                gapPadding: 0),
            fillColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            hintText: hint ?? 'Search',
            hintStyle: const TextStyle(color: Colors.white54),
          ),
        ),
      );

  /// Dropdrown
  static Widget dropDown(context,
          {required List<String> items,
          required int selected,
          String? hintText,
          required Function(int) onChange}) =>
      CustomAppDropdown(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.grey),
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: paddingHn + 3, vertical: paddingVn + 3),
        // childColor: AppColors.appBodyColor(context),
        childShadowColor: Theme.of(context).colorScheme.shadow,
        labelText: Text(
          selected == -1 ? hintText ?? "Select" : items[selected],
          style: TextStyles.mediumText(context, fontWeight: FontWeight.bold),
        ),
        onChange: (index) {
          onChange(index);
          // prints.log("Selected index: $index");
        },
        items: items
            .map((item) => Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: paddingHn, vertical: paddingVn),
                  child: Text(
                    item,
                    style: TextStyles.mediumText(context),
                  ),
                ))
            .toList(),
      );

  ///
  static Widget inputCardWidget(BuildContext context,
      {required String text,
      bool isHint = true,
      required Function onClick,
      Widget? trailing}) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.grey),
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: paddingHn + 3, vertical: paddingVn + 3),
        child: Row(
          children: [
            Expanded(
              child: Text(text,
                  style: TextStyles.normalText(context, isGrey: isHint)),
            ),
            trailing ??
                Icon(Icons.calendar_month,
                    color: Theme.of(context).primaryColor),
          ],
        ),
      ),
    );
  }

  /// Wash Plan
  static Widget washPlanCard(
    context, {
    String? image,
    required double amount,
    required String planValidity,
    List<String>? contents,
    Color? cardColor,
    bool isSelectable = false,
    bool isSelected = false,
    Function(bool)? onSelectChange,
  }) =>
      Container(
        width: double.infinity,
        // margin: const EdgeInsets.symmetric(vertical: paddingVn),

        padding: const EdgeInsets.only(bottom: 5, right: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? (cardColor ?? Theme.of(context).primaryColor).withOpacity(0.2)
              : cardColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(
          //     color: cardColor ?? Theme.of(context).primaryColor.withBlue(2),
          //     width: 2),
          boxShadow: !isSelected
              ? null
              : [
                  BoxShadow(
                    blurRadius: 10,
                    color: (cardColor ?? Theme.of(context).primaryColor)
                        .withOpacity(0.5),
                    offset: const Offset(1, 1),
                    spreadRadius: 0,
                  ),
                ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: paddingHn, vertical: paddingVn),
          decoration: !isSelected
              ? null
              : BoxDecoration(
                  color: cardColor ?? Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: (cardColor ?? Theme.of(context).primaryColor)
                            .withOpacity(0.3),
                        offset: const Offset(2, 2),
                        spreadRadius: 2,
                      ),
                    ]),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Image.asset(image ?? AppIcons.splashLogo,
                    color: AppColors.white),
              ),
              const SizedBox(width: paddingHn),
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: "\$${amount.toStringAsFixed(0)}/ ",
                              style: TextStyles.largText(context,
                                  fontSize: 24, fontWeight: FontWeight.w600),
                              children: [
                                TextSpan(
                                  text: planValidity,
                                  style: TextStyles.largText(context,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // isSelectable
                        //     ? Radio(
                        //         materialTapTargetSize:
                        //             MaterialTapTargetSize.shrinkWrap,
                        //         visualDensity: const VisualDensity(
                        //           horizontal: VisualDensity.minimumDensity,
                        //           vertical: VisualDensity.minimumDensity,
                        //         ),
                        //         value: isSelected,
                        //         groupValue: true,
                        //         fillColor:
                        //             MaterialStateProperty.all(AppColors.white),
                        //         activeColor: AppColors.white,
                        //         autofocus: true,
                        //         onChanged: (value) {
                        //           if (onSelectChange != null) {
                        //             onSelectChange(!isSelected);
                        //           }
                        //         },
                        //       )
                        //     : const SizedBox.shrink(),
                      ],
                    ),
                    const SizedBox(height: paddingVn),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: contents == null ? 0 : contents.length,
                      itemBuilder: (contex, index) => Row(
                        children: [
                          const Icon(
                            Icons.check,
                            color: AppColors.white,
                            size: 16,
                          ),
                          const SizedBox(width: paddingHn),
                          Expanded(
                            child: Text(
                              contents![index],
                              style: TextStyles.smallText(context,
                                  color: AppColors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  ///
  static Widget appImageSlider(
          {required List<String> items,
          required int currentIndex,
          required Function(int) onPageChanged}) =>
      Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 100,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  onPageChanged(index);
                  // appwashWalletController.currentSliderIndex.value = index;
                },
              ),
              items: items
                  .map((item) => SizedBox(
                        width: double.infinity,
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: paddingVn),
          SizedBox(
            height: 6,
            width: width * 0.8,
            child: Center(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: currentIndex == index ? 0 : 0,
                  ),
                  height: 5,
                  width: currentIndex == index ? paddingH : paddingHn,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: currentIndex == index
                          ? Theme.of(context).primaryColor
                          : AppColors.grey),
                ),
              ),
            ),
          ),
        ],
      );
}

///

///

Widget InkWellContainer({
  required Widget child,
  BorderRadiusGeometry? outerBorderRadius,
  Key? key,
  EdgeInsetsGeometry? padding,
  Color? color,
  double? width,
  double? height,
  EdgeInsetsGeometry? margin,
  required Function onClick,
}) =>
    ClipRRect(
      borderRadius: outerBorderRadius,
      child: Container(
        margin: margin,
        height: height,
        width: width,
        color: color,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: AppColors.black.withOpacity(0.2),
            highlightColor: AppColors.black.withOpacity(0.1),
            onTap: () => onClick(),
            child: Padding(
              padding: padding ?? const EdgeInsets.all(0),
              child: child,
            ),
          ),
        ),
      ),
    );