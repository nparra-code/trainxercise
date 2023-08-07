import 'package:flutter/material.dart';
import 'package:trainxercise/ui/widgets/large_button_widget.dart';
import 'package:trainxercise/ui/widgets/large_form_field.dart';
import 'package:trainxercise/ui/widgets/text_widget.dart';
import 'package:trainxercise/ui/widgets/title_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double devHeight = MediaQuery.sizeOf(context).height;
    double devWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: devWidth * 0.6,
                child: const TitleWidget(title: 'Hola, bienvenido de nuevo!')),
            Container(
              width: devWidth * 0.5,
              margin: const EdgeInsets.only(top: 15),
              child: const TextWidget(
                text: 'Ingresa tus credenciales para empezar a entrenar.',
                textAlign: TextAlign.center,
                opacity: 0.5,
              ),
            ),
            const LargeFormField(
                hint: 'Correo electronico',
                icon: Icon(Icons.alternate_email),
                checkIfPassword: false),
            Column(
              children: [
                const LargeFormField(
                  hint: 'Contraseña',
                  icon: Icon(Icons.password),
                  checkIfPassword: true,
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: devHeight * 0.0125, left: devWidth * 0.4),
                  child: const InkWell(
                    child: TextWidget(
                      text: 'Recupera tu contraseña',
                      textAlign: TextAlign.left,
                      opacity: 0.5,
                    ),
                  ),
                ),
              ],
            ),
            LargeButtonWidget(
                title: 'Entrar',
                buttonColor: Theme.of(context).colorScheme.primary,
                textColor: Colors.white),
            Stack(
              children: [
                Divider(
                  color: const Color.fromRGBO(0, 0, 0, 0.3),
                  thickness: 1,
                  indent: devWidth * 0.08333,
                  endIndent: devWidth * 0.08333,
                ),
                Center(
                    child: Container(
                  height: devHeight * 0.025,
                  width: devWidth * 0.1805,
                  color: Theme.of(context).scaffoldBackgroundColor,
                )),
                const Center(
                    child: TextWidget(
                        text: 'o usando',
                        textAlign: TextAlign.center,
                        opacity: 0.35))
              ],
            )
          ],
        ),
      ),
    );
  }
}
