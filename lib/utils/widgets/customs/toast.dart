import 'dart:ui';

import 'package:flutter/material.dart';

//https://www.kindacode.com/article/flutter-get-the-position-of-a-tap-x-y-coordinates/

class ToastKit {
  static bool isOpen = false;
  static OverlayEntry? floatingWidget;

  static OverlayEntry _toast(
    BuildContext context, {
    required String message,
    Color? color,
    Color? textColor,
    ToastPosition toastPosition = ToastPosition.BOTTOM,
    ToastType toastType = ToastType.NONE,
    bool blurBackgroud = true,
    double? opacity,
  }) {
    double extraHeightBottom = MediaQuery.of(context).viewInsets.bottom;
    double extraHeightTop = MediaQuery.of(context).viewInsets.top;
    return OverlayEntry(builder: (context) {
      return Positioned(
        top: toastPosition == ToastPosition.TOP ||
                toastPosition == ToastPosition.TOP_LEFT ||
                toastPosition == ToastPosition.TOP_RIGHT
            ? extraHeightTop + 50
            : null,
        bottom: toastPosition == ToastPosition.BOTTOM ||
                toastPosition == ToastPosition.BOTTOM_LEFT ||
                toastPosition == ToastPosition.BOTTOM_RIGHT
            ? extraHeightBottom + 50
            : null,
        child: ConstrainedBox(
          constraints: const BoxConstraints(),
          child: Material(
            color: Colors.transparent,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: toastPosition == ToastPosition.BOTTOM_LEFT
                    ? Alignment.bottomLeft
                    : toastPosition == ToastPosition.BOTTOM_RIGHT
                        ? Alignment.bottomRight
                        : toastPosition == ToastPosition.TOP_LEFT
                            ? Alignment.topLeft
                            : toastPosition == ToastPosition.TOP_RIGHT
                                ? Alignment.topRight
                                : Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: BackdropFilter(
                          filter: blurBackgroud
                              ? ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0)
                              : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: 1.0,
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 14, right: 14, top: 5, bottom: 5),
                              margin: const EdgeInsets.only(top: 8),
                              decoration: BoxDecoration(
                                  color: (color ?? Colors.black)
                                      .withOpacity(opacity ?? 0.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: Text(
                                message,
                                style: TextStyle(
                                  color: textColor ?? Colors.white,
                                ),
                                textAlign: toastPosition ==
                                            ToastPosition.BOTTOM_LEFT ||
                                        toastPosition == ToastPosition.TOP_LEFT
                                    ? TextAlign.left
                                    : toastPosition ==
                                                ToastPosition.BOTTOM_RIGHT ||
                                            toastPosition ==
                                                ToastPosition.TOP_RIGHT
                                        ? TextAlign.right
                                        : TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Positioned(
                      //   bottom: 0,
                      //   left: 0,
                      //   child: Container(
                      //     width: 16,
                      //     height: 16,
                      //     decoration: const BoxDecoration(
                      //         color: Colors.blue,
                      //         borderRadius: BorderRadius.only(
                      //             bottomLeft: Radius.circular(20),
                      //             topRight: Radius.circular(20))),
                      //   ),
                      // ),
                      toastType == ToastType.NONE
                          ? const SizedBox.shrink()
                          : Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (toastType == ToastType.INFO
                                            ? Colors.blue
                                            : toastType == ToastType.SUCCESS
                                                ? Colors.green
                                                : toastType == ToastType.WARNING
                                                    ? Colors.orange
                                                    : Colors.red)
                                        .withOpacity(0.9)),
                                child: Center(
                                  child: toastType == ToastType.INFO
                                      ? const Text(
                                          'i',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        )
                                      : toastType == ToastType.SUCCESS
                                          ? const Icon(Icons.check,
                                              color: Colors.white, size: 14)
                                          : toastType == ToastType.WARNING
                                              ? const Text(
                                                  '!',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                )
                                              : const Icon(Icons.close,
                                                  color: Colors.white,
                                                  size: 14),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  static showToast(
    BuildContext context, {
    required String message,
    ToastPosition toastPosition = ToastPosition.BOTTOM,
    ToastType toastType = ToastType.NONE,
    Color? color,
    Color? textColor,
    bool blurBackgroud = true,
    double? opacity,
    Duration? duration,
  }) async {
    if (floatingWidget == null) {
      floatingWidget = _toast(
        context,
        message: message,
        toastPosition: toastPosition,
        toastType: toastType,
        color: color,
        textColor: textColor,
        blurBackgroud: blurBackgroud,
        opacity: opacity,
      );
      Overlay.of(context).insert(floatingWidget!);
      await Future.delayed(duration ?? const Duration(milliseconds: 2500));
      floatingWidget!.remove();
      floatingWidget = null;
    }
  }
}

enum ToastPosition {
  TOP,
  BOTTOM,
  CENTER,
  TOP_RIGHT,
  TOP_LEFT,
  BOTTOM_RIGHT,
  BOTTOM_LEFT
}

enum ToastType { SUCCESS, INFO, WARNING, ERROR, NONE }
