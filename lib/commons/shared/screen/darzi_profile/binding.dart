import 'package:darzi_nearby/commons/commons.dart';

class DarziProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DarziProfileController>(
      DarziProfileController(),
      permanent: true,
    );
  }
}
