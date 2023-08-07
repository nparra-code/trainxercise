import 'package:flutter/material.dart';

class LargeFormField extends StatefulWidget {
  final String hint;
  final Icon icon;
  final bool checkIfPassword;
  const LargeFormField({super.key, required this.hint, required this.icon, required this.checkIfPassword});

  @override
  State<LargeFormField> createState() => _LargeFormFieldState();
}

class _LargeFormFieldState extends State<LargeFormField> {
  @override
  Widget build(BuildContext context) {
    double devHeight = MediaQuery.sizeOf(context).height;
    double devWidth = MediaQuery.sizeOf(context).width;
    return Container(
      height: devHeight*0.0625,
      width: devWidth*0.8333,
      padding: EdgeInsets.only(left: 13, right: 13),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(217, 217, 217, 1),
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: TextFormField(
        autocorrect: false,
        obscureText: widget.checkIfPassword,
        cursorRadius: Radius.circular(15),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: widget.icon,
          iconColor: Color.fromRGBO(0,0,0,0.25),
          hintText: widget.hint,
        ),
      )
    );
  }
}
