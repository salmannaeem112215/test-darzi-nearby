import 'package:darzi_nearby/api/darzi_nearby_api.dart';
import 'package:flutter/foundation.dart';

class ServerApi {
  factory ServerApi({bool isAdmin = false}) {
    final api = ServerApi._(isAdmin);
    api.login = LoginApi(api);
    api.darzi = DarziApi(api);
    return api;
  }
  ServerApi._(this.isAdmin);

  late final LoginApi login;
  late final DarziApi darzi;
  final bool isAdmin;

  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
  final firestore = FirebaseFirestore.instance;

  // ignore: avoid_print
}

extension ServerApiX on ServerApi {
  static debugPrint(dynamic val, {bool isError = false}) {
    if (kDebugMode) {
      print((isError ? 'ERROR' : '') + val.toString());
    }
  }
}
