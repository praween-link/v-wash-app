import 'package:appwash/routes/paths.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/logics/regex.dart';
import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/common_widgets.dart';
import 'package:appwash/utils/widgets/scaffo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeBackScreen extends StatelessWidget {
  const WelcomeBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget spaceHeight = const SizedBox(height: paddingV);
    Widget spaceWidth = const SizedBox(height: paddingH);
    return Scaffo(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            spaceHeight,
            Text(
              "Welcome Back",
              style: TextStyles.authMainTitle(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Sign to countinue",
              style: TextStyles.normalText(context, isGrey: true),
              textAlign: TextAlign.center,
            ),
            spaceHeight,
            CommonWidgets.inputField(
              context,
              title: "Mobile",
              hint: "Enter Mobile",
              controller: TextEditingController(),
              isPhoneInput: true,
              textInputType: TextInputType.phone,
              inputFormatters: [InputFormates.onlyNumber],
              maxLength: InputLength.phoneMax,
            ),
            spaceHeight,
            spaceHeight,
            CommonWidgets.button(
              context,
              title: "Get OTP",
              onClick: () {
                print("Get OTP");
                Get.toNamed(Routes.OTPVERIFICATION);
              },
            ),
          ],
        ),
      ),
    );
  }
}
