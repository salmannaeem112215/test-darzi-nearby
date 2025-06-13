import 'package:darzi_nearby/darzi_nearby.dart';

class Middleware {
  final home = HomeMiddleware();
  final location = LocationMiddleware();
  static final login = LoginMiddleware();
}
