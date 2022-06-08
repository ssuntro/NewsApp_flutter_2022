import 'package:flutter/material.dart';

enum NewsStatus { responded, closed, pendingResponse }

extension NewsStatusExtension on NewsStatus {
  Color get primaryColor {
    switch (this) {
      case NewsStatus.closed:
        return Color.fromARGB(255, 203, 236, 208);
      case NewsStatus.responded:
        return Color.fromARGB(255, 181, 231, 244);
      case NewsStatus.pendingResponse:
        return Color.fromARGB(255, 236, 214, 203);
      default:
        return null;
    }
  }

  Color get onPrimaryColor {
    switch (this) {
      case NewsStatus.closed:
        return Color.fromARGB(255, 48, 200, 71);
      case NewsStatus.responded:
        return Color.fromARGB(255, 20, 133, 161);
      case NewsStatus.pendingResponse:
        return Color.fromARGB(255, 200, 66, 48);
      default:
        return null;
    }
  }

  String get rawValue {
    switch (this) {
      case NewsStatus.closed:
        return "closed";
      case NewsStatus.responded:
        return "responded";
      case NewsStatus.pendingResponse:
        return "pendingResponse";
      default:
        return "";
    }
  }
}
