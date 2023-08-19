import 'dart:async';

import 'package:appwash/routes/paths.dart';
import 'package:appwash/utils/images/icons_path.dart';
// import 'package:appwash/utils/widgets/error_icon.dart';
import 'package:appwash/utils/widgets/image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpScr extends StatefulWidget {
  const SpScr({super.key});

  @override
  State<SpScr> createState() => _SpScrState();
}

class _SpScrState extends State<SpScr> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Get.offAllNamed(Routes.WELCOMEBACK);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.splashBgImg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: Get.height * 0.1),
          ImageView.assetView(AppIcons.splashLogo,
              height: Get.width * 0.4, width: Get.width * 0.4),
        ],
      ),
    ));
  }
}
