import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/scaffo.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffo(
      appBar: AppBar(title: const Text("About Us")),
      appBarBottomChild: const SizedBox.shrink(),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
            child: Text("About Us!", style: TextStyles.normalText(context))),
      ),
    );
  }
}
