import 'package:flutter/material.dart';

class ProfileStyles {
  static const double avatarRadius = 60.0;
  static const double cardMaxWidth = 600.0;
  static const EdgeInsets cardPadding = EdgeInsets.all(16.0);
  static const BorderRadius cardBorderRadius = BorderRadius.all(Radius.circular(18.0));

  // Blue gradient similar to the reference image (lighter top-left -> darker bottom-right)
  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2B6CB0), Color(0xFF16324F)],
  );

  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Color(0x44000000),
      spreadRadius: 2,
      blurRadius: 12,
      offset: Offset(0, 6),
    ),
  ];

  static const TextStyle nameStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white);
  static const TextStyle handleStyle = TextStyle(fontSize: 16, color: Colors.white70);
  static const TextStyle statLabelStyle = TextStyle(fontSize: 12, color: Colors.white70);
  static const TextStyle statNumberStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);
}
