import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final double opacity;

  const TextWidget({super.key, required this.text, required this.textAlign, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 14,
        color: Color.fromRGBO(0, 0, 0, opacity ?? 1)
      ),
    );
  }
}
