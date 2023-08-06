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
    return Container(
      width: devWidth * 0.8333,
      height: devHeight * 0.0625,
      child: Material(
        color: widget.buttonColor,
        child: InkWell(
            child: Center(child: SubtitleWidget(subtitle: widget.title)),
            onTap: widget.toDo,
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
    );
  }
}
