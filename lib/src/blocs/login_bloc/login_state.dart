part of 'login_bloc.dart';

abstract class BasicLoginState extends Equatable {
  final String email;
  final bool isEmailValid;
  final String password;
  final bool isPasswordValid;
  final bool isLoggedInProcess;
  final bool formSubmittedSuccessfully;
  final String token;

  const BasicLoginState(
      {this.email,
      this.isEmailValid,
      this.password,
      this.isPasswordValid,
      this.formSubmittedSuccessfully,
      this.isLoggedInProcess,
      this.token});

  @override
  List<Object> get props => null;

  BasicLoginState copyWith({
    String email,
    bool isEmailValid,
    String password,
    bool isPasswordValid,
    bool formSubmittedSuccessfully,
    bool isLoggedInProcess,
    String token,
  });
}

class LoginState extends BasicLoginState {
  final String email;
  final bool isEmailValid;
  final String password;
  final bool isPasswordValid;
  final bool isLoggedInProcess;
  final bool formSubmittedSuccessfully;
  final String token;

  const LoginState(
      {this.email,
      this.isEmailValid,
      this.password,
      this.isPasswordValid,
      this.formSubmittedSuccessfully,
      this.isLoggedInProcess,
      this.token});

  factory LoginState.initial() {
    return LoginState(
        email: '',
        isEmailValid: false,
        password: '',
        isPasswordValid: false,
        formSubmittedSuccessfully: false,
        isLoggedInProcess: false,
        token: '');
  }

  bool get isFormValid => isEmailValid && isPasswordValid;

  LoginState copyWith(
      {String email,
      bool isEmailValid,
      String password,
      bool isPasswordValid,
      bool formSubmittedSuccessfully,
      bool isLoggedInProcess,
      String token}) {
    return LoginState(
        email: email ?? this.email,
        isEmailValid: isEmailValid ?? this.isEmailValid,
        password: password ?? this.password,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        formSubmittedSuccessfully:
            formSubmittedSuccessfully ?? this.formSubmittedSuccessfully,
        isLoggedInProcess: isLoggedInProcess ?? this.isLoggedInProcess,
        token: token);
  }

  @override
  List<Object> get props => [
        email,
        isEmailValid,
        password,
        isPasswordValid,
        formSubmittedSuccessfully,
        isLoggedInProcess,
        token
      ];

  @override
  String toString() {
    return '''LoginState {
      email: $email,
      isEmailValid: $isEmailValid,
      password: $password,
      isPasswordValid: $isPasswordValid,
      formSubmittedSuccessfully: $formSubmittedSuccessfully,
      isLoggedInProcess: $isLoggedInProcess,
      token: $token
    }''';
  }
}

class ErrorLoginState extends BasicLoginState {
  final String message;

  ErrorLoginState(this.message);

  @override
  List<Object> get props => [message];

  @override
  BasicLoginState copyWith(
      {String email,
      bool isEmailValid,
      String password,
      bool isPasswordValid,
      bool formSubmittedSuccessfully,
      bool isLoggedInProcess,
      String token}) {
    return null;
  }
}

// class LoginInitial extends BasicLoginState {
//   @override
//   List<Object> get props => [];

//   @override
//   BasicLoginState copyWith(
//       {String email,
//       bool isEmailValid,
//       String password,
//       bool isPasswordValid,
//       bool formSubmittedSuccessfully,
//       bool isLoggedInProcess,
//       String token}) {
//     return null;
//   }
// }

// class LogginInState extends BasicLoginState {

//   @override
//   List<Object> get props => null;

//   @override
//   BasicLoginState copyWith({String email, bool isEmailValid, String password, bool isPasswordValid, bool formSubmittedSuccessfully, String token}) {
//     return null;
//   }

// }

// class LoggedInState extends LoginState {
//   final String token;

//   LoggedInState(this.token);

//   @override
//   List<Object> get props => [token];
// }

// class ErrorLoginState extends LoginState {
//   final String message;

//   ErrorLoginState(this.message);

//   @override
//   List<Object> get props => [message];
// }
