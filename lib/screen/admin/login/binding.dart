import 'package:darzi_nearby/darzi_nearby.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(
      LoginController(),
      permanent: false,
    );
  }
}
