import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/scaffo.dart';
import 'package:flutter/material.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffo(
      appBar: AppBar(title: const Text("Help & Support")),
      appBarBottomChild: const SizedBox.shrink(),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
            child:
                Text("Help & Support!", style: TextStyles.normalText(context))),
      ),
    );
  }
}
