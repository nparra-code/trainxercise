import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AuthenticationState.authenticated(
                  authenticationRepository.currentUser)
              : const AuthenticationState.unauthenticated(),
        ) {
    on<_AuthenticationUserChanged>(_onUserChanged);
    on<AuthenticationLogOutRequested>(_onLogoutRequested);
    _authenticationUserSubscription = _authenticationRepository.user.listen(
      (user) => add(_AuthenticationUserChanged(user)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  late StreamSubscription<User> _authenticationUserSubscription;

  void _onUserChanged(
      _AuthenticationUserChanged event, Emitter<AuthenticationState> emit) {
    emit(event.user.isNotEmpty
        ? AuthenticationState.authenticated(event.user)
        : const AuthenticationState.unauthenticated());
  }

  void _onLogoutRequested(
      AuthenticationLogOutRequested event, Emitter<AuthenticationState> emit) {
    unawaited(_authenticationRepository.logOut());
  }

  @override
  Future<void> close() {
    _authenticationUserSubscription.cancel();
    return super.close();
  }
}
