import 'package:darzi_nearby/screen/user/welcome/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Future<void> init() async {
    // initialize Firebase
    final appStorage = AppStorage();
    await appStorage.init();
    // check is the app for the first time
    if (appStorage.isFirstTime) {
      showWelcomeScreen();
    }
    //
  }

  void showWelcomeScreen() {
    debugPrint('First Time');
  }
}
