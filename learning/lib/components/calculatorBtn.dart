import 'package:flutter/material.dart';
import '../theme/light_theme.dart';

class CalculatorBtn extends StatefulWidget {
  final VoidCallback onPressed;
  final String buttonText;
  const CalculatorBtn(
      {Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);

  @override
  State<CalculatorBtn> createState() => _CalculatorBtnState();
}

class _CalculatorBtnState extends State<CalculatorBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        widget.buttonText,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
