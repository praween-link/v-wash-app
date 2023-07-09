import 'dart:async';

import 'package:appwash/routes/paths.dart';
import 'package:appwash/utils/constants/app_font_size.dart';
import 'package:appwash/utils/images/icons_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.SIGNUP);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.splashBgImg),
              fit: BoxFit.cover,
            ),
          ),
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingH),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.1),
                Image.asset(AppIcons.splashLogo,
                    height: height * 0.2, width: width * 0.6),
              ],
            ),
          )),
    );
  }
}
