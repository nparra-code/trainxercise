import 'package:flutter/material.dart';

class SubtitleWidget extends StatelessWidget {
  final String subtitle;
  final Color color;

  const SubtitleWidget({super.key, required this.subtitle, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: color),
    );
  }
}
