import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KeyboardHeightChecker extends StatefulWidget {
  const KeyboardHeightChecker({super.key});

  @override
  _KeyboardHeightCheckerState createState() => _KeyboardHeightCheckerState();
}

class _KeyboardHeightCheckerState extends State<KeyboardHeightChecker> {
  double keyboardHeight = 0.0;
  bool isKeyboardOpen = false;

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Listen for keyboard visibility changes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        keyboardHeight = mediaQuery.viewInsets.bottom;

        /// Check if the focus node has focus, which means the keyboard is open
        isKeyboardOpen = _focusNode.hasFocus;
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keyboard Height Checker'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                'Keyboard Height(${_focusNode.hasFocus}): ${Get.height.toStringAsFixed(2)}-${keyboardHeight.toStringAsFixed(2)} = ${(Get.height - keyboardHeight).toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
          Container(
            color: Colors.grey,
            padding: const EdgeInsets.all(16),
            child: const TextField(
              decoration: InputDecoration(hintText: 'Enter Text...'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
