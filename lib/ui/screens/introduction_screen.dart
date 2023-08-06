import 'package:flutter/material.dart';
import 'package:trainxercise/ui/widgets/large_button_widget.dart';
import 'package:trainxercise/ui/widgets/text_widget.dart';
import 'package:trainxercise/ui/widgets/title_widget.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {

  @override
  Widget build(BuildContext context) {
    double devHeight = MediaQuery.of(context).size.height;
    double devWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: devHeight * 0.5,
          color: Theme.of(context).colorScheme.primary,
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: devWidth * 0.722,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TitleWidget(title: 'Trainxercise'),
                  TextWidget(text: 'La aplicacion que necesitas para empezar a entrenar; con o sin experiencia. Dile a tu entrenador que planifique tus entrenos o hazlos tu mismo.', textAlign: TextAlign.center,),
                  LargeButtonWidget(title: 'Ingresar', buttonColor: Color.fromRGBO(217, 217, 217, 0.8)),
                  LargeButtonWidget(title: 'Registrar', buttonColor: Colors.amber)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
