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
        Stack(
          children: [
            Container(
              height: devHeight * 0.5,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 0)
                  ],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
            ),
            Center(
                child: Container(
                    margin: EdgeInsets.only(top: devHeight * 0.1625),
                    child: Image(
                        image:
                            const AssetImage('res/trainxercise-removebg.png'),
                        height: devHeight * 0.3125)))
          ],
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
                  TextWidget(
                    text:
                        'La aplicacion que necesitas para empezar a entrenar; con o sin experiencia. Dile a tu entrenador que planifique tus entrenos o hazlos tu mismo.',
                    textAlign: TextAlign.center,
                  ),
                  LargeButtonWidget(
                      title: 'Ingresar',
                      buttonColor: const Color.fromRGBO(215, 215, 215, 1)),
                  LargeButtonWidget(
                      title: 'Registrar',
                      buttonColor: const Color.fromRGBO(210, 210, 210, 1.0))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
