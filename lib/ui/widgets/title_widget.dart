import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  String title = "";

  TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
    );
  }
}
