import 'package:flutter/material.dart';
import '../theme/light_theme.dart';

class CalculatorInputField extends StatefulWidget {
  final TextEditingController controller;
  const CalculatorInputField({super.key, required this.controller});

  @override
  State<CalculatorInputField> createState() => _CalculatorInputFieldState();
}

class _CalculatorInputFieldState extends State<CalculatorInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextField(
          controller: widget.controller,
          // keyboardType: TextInputType.number,
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: 24),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '0',
            hintStyle:
                TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }
}
