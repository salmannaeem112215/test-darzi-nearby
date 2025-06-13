import 'package:darzi_nearby/darzi_nearby.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MySearchController>(
      MySearchController(),
      permanent: true,
    );
  }
}
