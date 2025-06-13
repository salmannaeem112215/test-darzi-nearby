import 'package:darzi_nearby/darzi_nearby.dart';

class AdminHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AdminHomeController>(
      AdminHomeController(),
      permanent: true,
    );
  }
}
