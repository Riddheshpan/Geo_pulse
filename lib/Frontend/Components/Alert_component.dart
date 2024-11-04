import 'package:flutter/material.dart';

class AlertComponent {
  static void showAlert({
    required BuildContext context,
    required String title,
    required String content,
    String confirmText = "Yes",
    String cancelText = "No",
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    TextStyle? titleTextStyle,
    TextStyle? contentTextStyle,
    TextStyle? confirmTextStyle,
    TextStyle? cancelTextStyle,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titleTextStyle: titleTextStyle ?? const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
          title: Text(
            title,
            style: titleTextStyle ?? const TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          content: Text(
            content,
            style: contentTextStyle ?? const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                if (onCancel != null) {
                  onCancel();
                }
                Navigator.of(context).pop();
              },
              child: Text(
                cancelText,
                style: cancelTextStyle ?? const TextStyle(fontSize: 22, color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                if (onConfirm != null) {
                  onConfirm();
                }
                Navigator.of(context).pop();
              },
              child: Text(
                confirmText,
                style: confirmTextStyle ?? const TextStyle(fontSize: 22, color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }
}
