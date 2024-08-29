import 'package:flutter/material.dart';

class AppBottomSheet {
  static Future<void> display({
    required BuildContext context,
    required Widget widget,
  }) async {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(25),
        topLeft: Radius.circular(25),
      )),
      builder: (BuildContext context) {
        return widget;
      },
    );
  }
}
