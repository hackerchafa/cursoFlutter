import 'package:flutter/material.dart';

class AppButtonStyles {
  static ButtonStyle rounded({ShapeBorder? shape}) => ElevatedButton.styleFrom(
        shape: shape ?? const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        minimumSize: const Size(48, 48),
      );
}
