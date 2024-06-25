import 'package:flutter/material.dart';

import 'label_text.dart';

class ShowCustomDialogBox {
  static Future showAlertDialogWithAction({
    required BuildContext context,
    required String title,
    required String content,
    required String message,
    final ValueChanged,
    rightButtonOnPressed,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () => Future.value(false),
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Container(
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelText(text: content),
                    SizedBox(height: 8),
                    LabelText(text: message),
                  ],
                ),
                title: Text(title),
                actions: [
                  OutlinedButton(
                    onPressed: rightButtonOnPressed,
                    child: const LabelText(
                      text: 'Accept',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
