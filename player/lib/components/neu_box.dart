import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;

  const NeuBox({
    super.key,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            offset: const Offset(10, 10),
            blurRadius: 20,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            offset: const Offset(-10, -10),
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: child,
    );
  }
}
