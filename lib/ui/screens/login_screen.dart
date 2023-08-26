import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:trainxercise/authentication/login/login_cubit.dart';
import 'package:trainxercise/ui/widgets/large_button_widget.dart';
import 'package:trainxercise/ui/widgets/large_form_field.dart';
import 'package:trainxercise/ui/widgets/subtitle_widget.dart';
import 'package:trainxercise/ui/widgets/text_widget.dart';
import 'package:trainxercise/ui/widgets/title_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double devHeight = MediaQuery.sizeOf(context).height;
    double devWidth = MediaQuery.sizeOf(context).width;
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: devWidth * 0.6,
                  child:
                      const TitleWidget(title: 'Hola, bienvenido de nuevo!')),
              Container(
                width: devWidth * 0.5,
                margin: const EdgeInsets.only(top: 15),
                child: const TextWidget(
                  text: 'Ingresa tus credenciales para empezar a entrenar.',
                  textAlign: TextAlign.center,
                  opacity: 0.5,
                ),
              ),
              _EmailInput(),
              Column(
                children: [
                  _PasswordInput(),
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
              _LoginButton(),
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
              ),
              _GoogleLoginButton()
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return LargeFormField(
            hint: 'Correo electronico',
            icon: const Icon(Icons.alternate_email),
            checkIfPassword: false,
            formKey: const Key('loginForm_emailInput_textField'),
            keyboardType: TextInputType.emailAddress,
            onChanged: (email) =>
                context.read<LoginCubit>().emailChanged(email));
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return LargeFormField(
            hint: 'Contraseña',
            icon: const Icon(Icons.password),
            checkIfPassword: true,
            formKey: const Key('loginForm_passwordInput_textField'),
            keyboardType: TextInputType.text,
            onChanged: (password) =>
                context.read<LoginCubit>().passwordChanged(password));
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : LargeButtonWidget(
                key: const Key('loginForm_continue_raisedButton'),
                toDo: state.isValid
                    ? () => context.read<LoginCubit>().logInWithCredentials()
                    : null,
                title: 'Entrar',
                buttonColor: Theme.of(context).colorScheme.primary,
                textColor: Colors.white);
      },
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.sizeOf(context).width;
    double devHeight = MediaQuery.sizeOf(context).height;
    return InkWell(
        key: const Key('loginForm_googleLogin_raisedButton'),
        onTap: () => context.read<LoginCubit>().logInWithGoogle(),
        child: Ink(
          width: devWidth * 0.50,
          height: devHeight * 0.0625,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(217, 217, 217, 1),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Center(
              child: SizedBox(
                  width: devWidth * 0.30,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(FontAwesomeIcons.google),
                      SubtitleWidget(subtitle: "Google", color: Colors.black),
                    ],
                  ))),
        ));
  }
}
