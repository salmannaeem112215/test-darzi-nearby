import 'dart:convert';

import 'package:darzi_nearby/models/models.dart';

class LoginInfo extends MultiValue {
  final Email email;
  final Password password;
  static final dummy =
      LoginInfo(email: 'salman.2215@gmail.com', password: '12345678 ABC');
  LoginInfo({
    required dynamic email,
    required dynamic password,
  })  : email = Email(email),
        password = Password(password);

  @override
  bool operator ==(Object other) => isIdentical<LoginInfo>(
      other,
      (other) => [
            password == other.password,
            email == other.email,
          ]);

  factory LoginInfo.fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return LoginInfo.fromJson(json);
  }
  factory LoginInfo.fromJson(Map<String, dynamic> json) {
    return LoginInfo(
      email: json[LoginInfoK.email],
      password: json[LoginInfoK.password],
    );
  }

  @override
  Map<String, dynamic> get toJson {
    return {
      LoginInfoK.email: email.value,
      LoginInfoK.password: password.value,
    };
  }

  Map<String, List<String>> get toStringJson => {
        LoginInfoK.email: [email.value],
        LoginInfoK.password: [password.value],
      };

  @override
  List<String?> get isValid => [
        password.isValid,
        email.isValid,
      ];
}

extension LoginInfoK on LoginInfo {
  static const String access = 'access';
  static const String email = 'email';
  static const String password = 'password';
}
