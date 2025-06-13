import 'package:darzi_nearby/darzi_nearby.dart';

class EditDarziController extends GetxController {
  late final DarziForm form;
  void onScreenInit(DarziInfo data) {
    form = DarziForm(oldData: data);
  }

  Future<void> editDarzi(DarziInfo oldDarzi) async {
    if (form.isValid()) {
      final dazriAdd = form.darziInfoAdd(uid: oldDarzi.uid);
      final darzi = await server.darzi.editDarzi(dazriAdd);
      final c = Get.find<AdminHomeController>();
      final existingDarzi =
          c.darizs.firstWhereOrNull((element) => element.uid == darzi.uid);
      if (existingDarzi != null) {
        c.darizs.remove(existingDarzi);
        c.darizs.insert(0, darzi);
      }

      Get.back();
    } else {}
  }
}
