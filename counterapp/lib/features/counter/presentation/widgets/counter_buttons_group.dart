import 'package:flutter/material.dart';

class CounterButtonsGroup extends StatelessWidget {
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onReset;

  const CounterButtonsGroup({
    super.key,
    required this.onIncrement,
    required this.onDecrement,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onDecrement,
            icon: const Icon(Icons.remove),
            tooltip: 'Decrementar',
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: onReset,
            icon: const Icon(Icons.refresh),
            tooltip: 'Reiniciar',
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: onIncrement,
            icon: const Icon(Icons.add),
            tooltip: 'Incrementar',
          ),
        ],
      ),
    );
  }
}
