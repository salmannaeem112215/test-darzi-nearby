import 'package:darzi_nearby/darzi_nearby.dart';

class LoginForm {
  final email = DarziFormEnity(
    'Email Addres',
    "Enter your email",
    validator: (val) => Email(val).isValid,
  );
  final password = DarziFormEnity(
    'Password',
    "Enter your password",
    validator: (val) => Password(val).isValid,
  );

  LoginInfo get loginInfo => LoginInfo(
        email: email.controller.text,
        password: password.controller.text,
      );

  bool get isValid {
    return key.currentState!.validate();
  }

  final key = GlobalKey<FormState>();
}
