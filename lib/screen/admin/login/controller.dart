import 'package:darzi_nearby/darzi_nearby.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 150))
        .then((value) => _onInit());
  }

  void _onInit() {}

  final form = LoginForm();

  Future<void> doLogin() async {
    if (form.isValid) {
      final li = form.loginInfo;
      li.throwIfNotValid();
      try {
        final res = await server.login.login(li);
        if (res == null) {
          MyApp.routes.adminHome.offAllNamed();
        } else {
          Utility.showError(res);
        }
      } catch (e) {
        Utility.showError(e);
      }
    }
  }
}
