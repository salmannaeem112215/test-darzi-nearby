import 'package:darzi_nearby/darzi_nearby.dart';

class AddDarziBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AddDarziController>(
      AddDarziController(),
      permanent: false,
    );
  }
}
