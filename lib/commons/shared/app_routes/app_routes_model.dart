import 'package:darzi_nearby/commons/commons.dart';

abstract class AppRouteModal {
  final String name;
  final Bindings? binding;
  final List<GetMiddleware>? middlewares;
  AppRouteModal({
    required this.name,
    this.binding,
    this.middlewares,
  });

  Widget Function() get page;
  GetPage get getPage {
    return GetPage(
      name: name,
      page: page,
      binding: binding,
      middlewares: middlewares,
    );
  }

  Future<void> _toNamed({dynamic arguments}) async {
    return await Get.toNamed(name, arguments: arguments);
  }

  Future<void> _offAllNamed({dynamic arguments}) async {
    return await Get.offAllNamed(name, arguments: arguments);
  }
}

class AppRouteModalSimple extends AppRouteModal {
  final Widget Function() _page;
  AppRouteModalSimple({
    required super.name,
    super.binding,
    required Widget Function() page,
    super.middlewares,
  }) : _page = page;
  @override
  Widget Function() get page => _page;
  Future<void> toNamed({dynamic arguments}) async =>
      super._toNamed(arguments: arguments);

  Future<void> offAllNamed({dynamic arguments}) async =>
      super._offAllNamed(arguments: arguments);
  RouteSettings routeSettings() {
    return RouteSettings(
      name: name,
    );
  }
}

class AppRouteModalData<T> extends AppRouteModal {
  final Widget Function(T) _page;
  final T Function()? getData;
  final T Function() onErrorData;
  AppRouteModalData({
    required super.name,
    super.binding,
    required Widget Function(T) page,
    this.getData,
    required this.onErrorData,
    super.middlewares,
  }) : _page = page;

  T get _data {
    try {
      if (getData != null) {
        return getData!();
      } else {
        return Get.arguments as T;
      }
    } catch (e) {
      return onErrorData();
    }
  }

  RouteSettings routeSettings(T data) {
    return RouteSettings(
      name: name,
      arguments: data,
    );
  }

  @override
  Widget Function() get page => () => _page(_data);

  Future<void> toNamed(T data) async => super._toNamed(arguments: data);
  Future<void> offAllNamed(T data) async => super._offAllNamed(arguments: data);
}
