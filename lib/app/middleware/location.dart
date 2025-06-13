import 'package:darzi_nearby/darzi_nearby.dart';

class LocationMiddleware extends MyMiddleware {
  @override
  List<GetMiddleware> get middleware => [this];
  @override
  int? get priority => 2;
  @override
  RouteSettings? redirect(String? route) {
    if (Location.position != null) {
      return MyApp.routes.home.routeSettings();
    }
    return null;
  }
}
