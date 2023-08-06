import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String text = "";
  TextAlign textAlign;
  TextWidget({super.key, required this.text, required this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: const TextStyle(fontSize: 14, ),
    );;
  }
}
