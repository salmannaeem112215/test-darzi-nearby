import 'package:darzi_nearby/commons/commons.dart';

abstract class MyMiddleware extends GetMiddleware {
  List<GetMiddleware> get middleware;
}
