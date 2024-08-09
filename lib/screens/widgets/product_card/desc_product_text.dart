import 'package:flutter/material.dart';

class DescProductText extends StatelessWidget {
  const DescProductText({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(fontSize: 12),
    );
  }
}
