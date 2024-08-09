import 'package:flutter/material.dart';

class TextFormFieldApp extends StatelessWidget {
  const TextFormFieldApp({
    super.key,
    required this.controller,
    required this.text,
    required this.obscureText,
  });

  final TextEditingController controller;
  final String text;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: text),
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Пожалуйста, введите ваш $text';
        }
        return null;
      },
    );
  }
}
