import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pedidosapp_v1/src/login/bloc/login_bloc.dart';
import 'package:pedidosapp_v1/src/pages/login_page_new.dart';
import 'package:pedidosapp_v1/src/repository/user_repository.dart';


class LoginScreen extends StatelessWidget {
  final UserRepository _userRepository;

  LoginScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(userRepository: _userRepository),
        child: LoginPage(userRepository: _userRepository),
      ),
    );
  }
}