import 'package:darzi_nearby/darzi_nearby.dart';

class EditDarziBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EditDarziController>(
      EditDarziController(),
      permanent: false,
    );
  }
}
