import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptiveText extends StatelessWidget {
  final String data;
  final TextStyle? style;

  const AdaptiveText(this.data, {this.style, super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return SelectableText(data, style: style);
    } else {
      return Text(data, style: style);
    }
  }
}