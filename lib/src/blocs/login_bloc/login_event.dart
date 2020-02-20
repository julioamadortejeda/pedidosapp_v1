part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

// eventos que se pueden emitir
class DoLoginEvent extends LoginEvent {
  final String email;
  final String password;

  DoLoginEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class EmailChanged extends LoginEvent {
  final String email;
  const EmailChanged({this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged { email: $email }';
}

class PasswordChanged extends LoginEvent {
  final String password;

  const PasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'PasswordChanged { password: $password }';
}
