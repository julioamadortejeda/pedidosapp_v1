import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../login_bloc/login_logic.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginLogic logic;

  LoginBloc({@required this.logic});

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is DoLoginEvent) {
      yield LogginInState();

      try {
        String token = await logic.login(event.email, event.password);
        yield LoggedInState(token);
      } on LoginException {
        yield ErrorLoginState('Error al iniciar sesion.');
      }
    }
  }
}
