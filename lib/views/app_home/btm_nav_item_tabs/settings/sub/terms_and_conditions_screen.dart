import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/scaffo.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffo(
      appBar: AppBar(title: const Text("Terms & Conditions")),
      appBarBottomChild: const SizedBox.shrink(),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
            child: Text("Terms & Conditions!",
                style: TextStyles.normalText(context))),
      ),
    );
  }
}
