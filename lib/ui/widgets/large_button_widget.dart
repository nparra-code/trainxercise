import 'package:flutter/material.dart';
import 'package:trainxercise/ui/widgets/subtitle_widget.dart';

class LargeButtonWidget extends StatefulWidget {
  String title = "";
  Function()? toDo = () {};
  Color? buttonColor;

  LargeButtonWidget(
      {super.key, required this.title, this.toDo, this.buttonColor});

  @override
  State<LargeButtonWidget> createState() => _LargeButtonWidgetState();
}

class _LargeButtonWidgetState extends State<LargeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    double devHeight = MediaQuery.of(context).size.height;
    double devWidth = MediaQuery.of(context).size.width;
    return InkWell(
      child: Ink(
        width: devWidth * 0.8333,
        height: devHeight * 0.0625,
        decoration: BoxDecoration(
            color: widget.buttonColor,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Center(child: SubtitleWidget(subtitle: widget.title)),
      ),
    );
  }
}
