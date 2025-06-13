import 'package:darzi_nearby/darzi_nearby.dart';

class DirectUrlMiddleware extends MyMiddleware {
  @override
  List<GetMiddleware> get middleware => [this];
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (Get.previousRoute == '') {
      return MyApp.routes.splash.routeSettings();
    }
    return null;
  }
}
