abstract class LoginLogic {
  Future<String> login(String email, password);
  Future<String> logout();
}

class LoginException implements Exception {}

class SimpleLoginlogic extends LoginLogic {
  @override
  Future<String> login(String email, password) async {
    await Future.delayed(Duration(seconds: 2));
    print(email);
    print(password);
    if (email != 'julio.amadortejeda@gmail.com' || password != '123456789') {
      throw LoginException();
    }

    return 'token';
  }

  @override
  Future<String> logout() async {
    return '';
  }
}
