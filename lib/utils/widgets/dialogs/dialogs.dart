import 'package:appwash/utils/constants/app_colors.dart';
import 'package:appwash/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialogs {
  /// Logout
  static logout(BuildContext context, {required Function confirm}) => show(
        context,
        title: "Logout",
        child: Text(
          "Are you sure\nwant to logout!",
          style: TextStyles.normalText(context),
          textAlign: TextAlign.center,
        ),
        confirm: () => confirm(),
      );

  /// Confirm
  static confirm(BuildContext context,
          {required Function confirm,
          required String bodyText,
          String? title}) =>
      show(
        context,
        title: title ?? "Confirmation",
        child: Text(
          bodyText,
          style: TextStyles.normalText(context, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
        confirm: () => confirm(),
      );

  /// Common
  static show(BuildContext context,
          {String? title,
          required Widget child,
          required Function? confirm,
          Function? cancel,
          bool barrierDismissible = true}) =>
      Get.dialog(
        barrierDismissible: barrierDismissible,
        AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          content: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Wrap(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 14),
                    title == null
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  title,
                                  style: TextStyles.mediumText(context,
                                      color: AppColors.red,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "~",
                                  style: TextStyles.largText(context,
                                      color: AppColors.red,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          ),
                    title == null
                        ? const SizedBox.shrink()
                        : const SizedBox(height: 8),
                    title == null ? const SizedBox.shrink() : const Divider(),
                    title == null
                        ? const SizedBox.shrink()
                        : const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: child,
                    ),
                    const SizedBox(height: 8),
                    confirm == null
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () =>
                                      cancel != null ? cancel() : Get.back(),
                                  child: Text(
                                    "No",
                                    style: TextStyles.mediumText(context,
                                        fontWeight: FontWeight.w800,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => confirm(),
                                  child: Text(
                                    "Yes",
                                    style: TextStyles.mediumText(context,
                                        fontWeight: FontWeight.w800,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
