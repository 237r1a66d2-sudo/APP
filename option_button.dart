lib/widgets/option_button.dart
import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  OptionButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: ElevatedButton(onPressed: onPressed, child: Text(text)),
    );
  }
}
