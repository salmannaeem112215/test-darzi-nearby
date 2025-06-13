import 'package:darzi_nearby/darzi_nearby.dart';

class AddDarziController extends GetxController {
  final form = DarziForm();
  Future<void> addDarzi() async {
    if (form.isValid()) {
      final dazriAdd = form.darziInfoAdd();
      final darzi = await server.darzi.addDarzi(dazriAdd);
      Get.find<AdminHomeController>().darizs.insert(0, darzi);
      Get.back();
    } else {}
  }
}
