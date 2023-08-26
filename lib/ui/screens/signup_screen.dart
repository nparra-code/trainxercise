import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:trainxercise/ui/widgets/large_button_widget.dart';

import '../../authentication/sign_up/sign_up_cubit.dart';
import '../widgets/large_form_field.dart';
import '../widgets/text_widget.dart';
import '../widgets/title_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double devHeight = MediaQuery.sizeOf(context).height;
    double devWidth = MediaQuery.sizeOf(context).width;
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
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
                  child: const TitleWidget(title: 'Hola, bienvenido!')),
              Container(
                width: devWidth * 0.5,
                margin: const EdgeInsets.only(top: 15),
                child: const TextWidget(
                  text:
                      'Ingresa tus datos para registrarte en nuestra base de datos.',
                  textAlign: TextAlign.center,
                  opacity: 0.5,
                ),
              ),
              _NameInput(),
              _EmailInput(),
              _PasswordInput(),
              _ConfirmPasswordInput(),
              _SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const LargeFormField(
        hint: 'Nombre y Apellido',
        icon: Icon(Icons.alternate_email),
        checkIfPassword: false,
        formKey: Key('loginForm_emailInput_textField'),
        keyboardType: TextInputType.name);
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return LargeFormField(
            hint: 'Correo electronico',
            icon: const Icon(Icons.alternate_email),
            checkIfPassword: false,
            formKey: const Key('signUpForm_emailInput_textField'),
            keyboardType: TextInputType.emailAddress,
            onChanged: (email) =>
                context.read<SignUpCubit>().emailChanged(email),
            errorText:
                state.email.displayError != null ? 'invalid email' : null);
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return LargeFormField(
            hint: 'Contraseña',
            icon: const Icon(Icons.password),
            checkIfPassword: true,
            formKey: const Key('signUpForm_passwordInput_textField'),
            keyboardType: TextInputType.text,
            onChanged: (password) =>
                context.read<SignUpCubit>().passwordChanged(password),
            errorText: state.password.displayError != null
                ? 'invalid password'
                : null);
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return LargeFormField(
            hint: 'Confirma contraseña',
            icon: const Icon(Icons.password),
            checkIfPassword: true,
            formKey: const Key('signUpForm_confirmedPasswordInput_textField'),
            keyboardType: TextInputType.text,
            onChanged: (confirmPassword) => context
                .read<SignUpCubit>()
                .confirmedPasswordChanged(confirmPassword),
            errorText: state.confirmedPassword.displayError != null
                ? 'passwords do not match'
                : null);
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : LargeButtonWidget(
                key: const Key('signUpForm_continue_raisedButton'),
                toDo: state.isValid
                    ? () => context.read<SignUpCubit>().signUpFormSubmitted()
                    : null,
                title: 'Registrar',
                buttonColor: Theme.of(context).colorScheme.primary,
                textColor: Colors.white);
      },
    );
  }
}
