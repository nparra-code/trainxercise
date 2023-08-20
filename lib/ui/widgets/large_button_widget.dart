import 'package:flutter/material.dart';
import 'package:trainxercise/ui/widgets/subtitle_widget.dart';

class LargeButtonWidget extends StatefulWidget {
  final String title;
  final Function()? toDo;
  final Color buttonColor;
  final Color textColor;
  final Key? buttonKey;

  const LargeButtonWidget(
      {super.key, required this.title, this.toDo, required this.buttonColor, required this.textColor, this.buttonKey});

  @override
  State<LargeButtonWidget> createState() => _LargeButtonWidgetState();
}

class _LargeButtonWidgetState extends State<LargeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    double devHeight = MediaQuery.sizeOf(context).height;
    double devWidth = MediaQuery.sizeOf(context).width;
    return InkWell(
      key: widget.buttonKey,
      onTap: widget.toDo,
      child: Ink(
        width: devWidth * 0.8333,
        height: devHeight * 0.0625,
        decoration: BoxDecoration(
            color: widget.buttonColor,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Center(child: SubtitleWidget(subtitle: widget.title, color: widget.textColor)),
      ),
    );
  }
}
