import 'package:darzi_nearby/darzi_nearby.dart';

class LoginMiddleware extends MyMiddleware {
  @override
  List<GetMiddleware> get middleware => [this];
  @override
  int? get priority => 2;
  @override
  RouteSettings? redirect(String? route) {
    if (server.auth.currentUser == null) {
      return MyApp.routes.adminLogin.routeSettings();
    }
    return null;
  }
}
