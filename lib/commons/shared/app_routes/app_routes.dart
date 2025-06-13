import 'package:darzi_nearby/commons/commons.dart';

abstract class AppRoutes {
  String get initialRoute;

  List<AppRouteModal> get appRoutes;

  List<GetPage> get getPages => appRoutes.map((e) => e.getPage).toList();
}
