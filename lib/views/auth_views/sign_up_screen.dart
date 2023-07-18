import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/images/icons_path.dart';
import 'package:appwash/utils/logics/regex.dart';
import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/common_widgets.dart';
import 'package:appwash/utils/widgets/scaffo.dart';
import 'package:appwash/viewmodel/auth/signup_auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final AuthViewModel authViewModel = Get.put(AuthViewModel());
  @override
  Widget build(BuildContext context) {
    Widget spaceHeight = const SizedBox(height: paddingV);
    Widget spaceWidth = const SizedBox(height: paddingH);
    // print("HHHHHHHHHHHHHH: h: $sfsHeight, w: $sfsWidth");
    // print(
    //     "Check Validation: ${Validations.check(CheckValid(email: 'Hello@g.com', firstName: "Rohan"))}");
    return Stack(
      children: [
        Scaffo(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Obx(
              () => Column(
                children: [
                  spaceHeight,
                  Text(
                    "Create Account",
                    style: TextStyles.authMainTitle(context),
                    textAlign: TextAlign.center,
                  ),
                  spaceHeight,
                  CommonWidgets.inputField(
                    context,
                    title: "First Name",
                    hint: "Enter First Name",
                    textInputType: TextInputType.name,
                    validationMsg: authViewModel.firstNameStatus(msg: true),
                    validationStatus: authViewModel.firstNameStatus(),
                    inputFormatters: [InputFormates.onlyLetterSpace],
                    maxLength: InputLength.firstNameMax,
                    onChanged: (text) {
                      authViewModel.updateSignUpData(fname: text);
                    },
                  ),
                  spaceHeight,
                  CommonWidgets.inputField(
                    context,
                    title: "Last Name",
                    hint: "Enter Last Name",
                    textInputType: TextInputType.name,
                    validationMsg: authViewModel.lastNameStatus(msg: true),
                    validationStatus: authViewModel.lastNameStatus(),
                    inputFormatters: [InputFormates.onlyLetterSpace],
                    maxLength: InputLength.lastNameMax,
                    onChanged: (text) {
                      authViewModel.updateSignUpData(lname: text);
                    },
                  ),
                  spaceHeight,
                  CommonWidgets.inputField(
                    context,
                    title: "Email",
                    hint: "Enter Email",
                    textInputType: TextInputType.emailAddress,
                    inputFormatters: [InputFormates.emojiDeny],
                    validationMsg: authViewModel.emailStatus(msg: true),
                    validationStatus: authViewModel.emailStatus(),
                    maxLength: InputLength.emailMax,
                    onChanged: (text) {
                      authViewModel.updateSignUpData(emailId: text);
                    },
                  ),
                  spaceHeight,
                  spaceHeight,
                  CommonWidgets.button(
                    context,
                    // color: const Color(0xff34c0eb),
                    title: "Create Account",
                    onClick: () {
                      print("${{
                        'f-name': authViewModel.firstName,
                        'l-name': authViewModel.lastName,
                        'email': authViewModel.email,
                      }}");
                      authViewModel.submit(context);
                      // Fluttertoast.showToast(
                      //   msg: '이 기기에서 웹 페이지를 열 수가 없습니다.',
                      //   // timeInSecForIosWeb: 2,
                      //   backgroundColor: CupertinoColors.activeOrange,
                      //   textColor: Colors.white,
                      //   fontSize: 14,
                      //   // gravity: ToastGravity.SNACKBAR,
                      // );

                      // print("Submit");
                      // Get.to(() => const KeyboardHeightChecker());
                      // Get.toNamed(Routes.WELCOMEBACK);
                    },
                  ),
                  spaceHeight,
                  spaceHeight,
                  Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: _divider(context,
                              margin: const EdgeInsets.only(left: paddingH))),
                      spaceWidth,
                      Text("sign up with",
                          style: TextStyles.smallText(context)),
                      spaceWidth,
                      Flexible(
                        flex: 1,
                        child: _divider(context,
                            margin: const EdgeInsets.only(right: paddingH)),
                      ),
                    ],
                  ),
                  spaceHeight,
                  spaceHeight,
                  CommonWidgets.button(
                    context,
                    onClick: () {},
                    title: "Signup",
                    withBorder: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sign up with Google",
                            style: TextStyles.normalText(context)),
                        const SizedBox(width: paddingH),
                        Image.asset(AppIcons.googleIcon, height: 25, width: 25),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: SafeArea(
            child: CommonWidgets.circularBack(),
          ),
        ),
      ],
    );
  }

  Widget _divider(BuildContext context, {EdgeInsetsGeometry? margin}) {
    return Container(
      height: 1,
      margin: margin,
      decoration: BoxDecoration(
        // color: Theme.of(context).primaryColor.withOpacity(0.5),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            Theme.of(context).primaryColor.withOpacity(0.5),
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.5),
            Theme.of(context).scaffoldBackgroundColor,
          ],
        ),
      ),
    );
  }
}
