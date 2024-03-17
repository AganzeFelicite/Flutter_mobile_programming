import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class StyledToastComponent {
  static void showSuccessToast(String message, BuildContext context) {
    showToast(
      message,
      context: context,
      animation: StyledToastAnimation.fade,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.bottom,
      animDuration: Duration(milliseconds: 300),
      duration: Duration(seconds: 2),
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
      backgroundColor: Colors.green,
      textStyle: TextStyle(color: Colors.white),
    );
  }

  static void showErrorToast(String message, BuildContext context) {
    showToast(
      message,
      context: context,
      animation: StyledToastAnimation.fade,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.bottom,
      animDuration: Duration(milliseconds: 300),
      duration: Duration(seconds: 2),
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
      backgroundColor: Colors.red,
      textStyle: TextStyle(color: Colors.white),
    );
  }
}
