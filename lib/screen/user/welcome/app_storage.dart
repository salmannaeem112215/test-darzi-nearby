import 'package:darzi_nearby/darzi_nearby.dart';

class AppStorage {
  static late final AppStorage _self;
  factory AppStorage() {
    try {
      return _self;
    } catch (e) {
      _self = AppStorage._();
      return _self;
    }
  }
  AppStorage._() {
    debugPrint("APP STORAGE CREATED");
  }
  final box = GetStorage();

  bool _isFirstTime = true;

  bool get isFirstTime => _isFirstTime;

  Future<void> init() async {
    await GetStorage.init();
    loadIsFirstTime();
  }

  Future<void> saveIsFirstTime(bool value) async {
    _isFirstTime = value;
    await box.write('isFirstTime', value);
  }

  Future<void> loadIsFirstTime() async {
    _isFirstTime = box.read('isFirstTime') ?? true;
  }
}
