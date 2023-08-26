import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainxercise/authentication/bloc/authentication_bloc.dart';
import 'package:trainxercise/ui/screens/home_screen.dart';
import 'package:trainxercise/ui/screens/introduction_screen.dart';

class AppMaterial extends StatelessWidget {
  final AuthenticationRepository _authenticationRepository;

  const AppMaterial(
      {super.key, required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
            authenticationRepository: _authenticationRepository),
        child: MaterialApp(
          title: 'Trainxercise',
          theme: ThemeData(
            fontFamily: 'Lexend',
            scaffoldBackgroundColor: const Color.fromRGBO(224, 225, 221, 1),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color.fromRGBO(17, 38, 59, 1),
            ),
          ),
          home: const App(title: 'Trainxercise'),
        ),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key, required this.title});

  final String title;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    return Scaffold(
      body: user.isEmpty ? const IntroductionScreen() : const HomeScreen(),
    );
  }
}
