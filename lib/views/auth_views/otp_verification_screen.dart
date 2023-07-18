import 'package:appwash/routes/paths.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/common_widgets.dart';
import 'package:appwash/utils/widgets/scaffo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen({super.key});
  var focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    Widget spaceHeight = const SizedBox(height: paddingV);
    // Widget spaceWidth = const SizedBox(height: paddingH);
    return Scaffo(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            spaceHeight,
            Text("OTP Verification",
                style: TextStyles.authMainTitle(context),
                textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(
              "We have send the OTP on +91 9882761105\nwill apply auto to the fields",
              style: TextStyles.normalText(context, isGrey: true),
              textAlign: TextAlign.center,
            ),
            spaceHeight,
            Row(
              children: [
                const SizedBox(width: 14),
                Flexible(
                  flex: 1,
                  child: CommonWidgets.inputField(
                    context,
                    controller: TextEditingController(),
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    counterText: '',
                  ),
                ),
                const SizedBox(width: 14),
                Flexible(
                  flex: 1,
                  child: CommonWidgets.inputField(
                    context,
                    controller: TextEditingController(),
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    counterText: '',
                  ),
                ),
                const SizedBox(width: 14),
                Flexible(
                  flex: 1,
                  child: CommonWidgets.inputField(
                    context,
                    controller: TextEditingController(),
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    counterText: '',
                  ),
                ),
                const SizedBox(width: 14),
                Flexible(
                  flex: 1,
                  child: CommonWidgets.inputField(
                    context,
                    controller: TextEditingController(),
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    textInputType: TextInputType.number,
                    counterText: '',
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 14),
            RichText(
              text: TextSpan(
                text: 'I didn’t receive a code! ',
                style: TextStyles.normalText(context,
                    color: Theme.of(context).textTheme.bodySmall!.color),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Resend',
                      style: TextStyles.normalText(context,
                          color: Theme.of(context).primaryColor)),
                ],
              ),
            ),
            spaceHeight,
            spaceHeight,
            CommonWidgets.button(
              context,
              title: "Verify & Proceed",
              onClick: () {
                print("Verify & Proceed");
                Get.toNamed(Routes.MAINHOME);
              },
            ),
          ],
        ),
      ),
    );
  }
}
