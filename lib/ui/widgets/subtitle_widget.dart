import 'package:flutter/material.dart';

class SubtitleWidget extends StatelessWidget {
  String subtitle = "";

  SubtitleWidget({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    );
  }
}
