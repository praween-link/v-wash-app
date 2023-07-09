import 'package:appwash/utils/styles/text_styles.dart';
import 'package:appwash/utils/widgets/scaffo.dart';
import 'package:flutter/material.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffo(
      appBar: AppBar(title: const Text("Account Details")),
      appBarBottomChild: const SizedBox.shrink(),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
            child: Text("Account Details!",
                style: TextStyles.normalText(context))),
      ),
    );
  }
}
