import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/scaffo.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffo(
      appBar: AppBar(title: const Text("Privacy Policy")),
      appBarBottomChild: const SizedBox.shrink(),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
            child:
                Text("Privacy Policy!", style: TextStyles.normalText(context))),
      ),
    );
  }
}
