import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../login_bloc/login_logic.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, BasicLoginState> {
  final LoginLogic logic;

  final RegExp _emailRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );
  final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$',
  );

  LoginBloc({@required this.logic});

  @override
  BasicLoginState get initialState => LoginState.initial();

  @override
  Stream<BasicLoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is EmailChanged) {
      yield state.copyWith(
        email: event.email,
        isEmailValid: _isEmailValid(event.email),
      );
    }

    if (event is PasswordChanged) {
      yield state.copyWith(
        password: event.password,
        isPasswordValid: _isPasswordValid(event.password),
      );
    }

    if (event is DoLoginEvent) {
      yield state.copyWith(isLoggedInProcess: true);
      //yield LogginInState();

      try {
        String token = await logic.login(event.email, event.password);
        yield state.copyWith(isLoggedInProcess: false);
        yield state.copyWith(token: token);
      } on LoginException {
        yield state.copyWith(isLoggedInProcess: false);
        //yield ErrorLoginState('Datos incorrectos.');
        //yield ErrorLoginState('Error al iniciar sesion.');
      }
    }
  }

  bool _isEmailValid(String email) {
    return _emailRegExp.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    return _passwordRegExp.hasMatch(password);
  }
}
