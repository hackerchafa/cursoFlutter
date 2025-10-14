import 'package:flutter/material.dart';

import 'icon_action_button.dart';

class CounterActionButtonGroup extends StatelessWidget {
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CounterActionButtonGroup({super.key, required this.onIncrement, required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconActionButton(icon: Icons.remove, onPressed: onDecrement),
        const SizedBox(width: 12),
        IconActionButton(icon: Icons.add, onPressed: onIncrement),
      ],
    );
  }
}
