import 'package:darzi_nearby/commons/commons.dart';

class MyView {
  static void showDialog(Widget child) {
    Get.dialog(
      Container(
        constraints: const BoxConstraints(maxHeight: 300, maxWidth: 300),
        margin: const EdgeInsets.all(32),
        child: child,
      ),
    );
  }

  // static void showDialog(Widget child) {
  //   Get.dialog(
  //     child,
  //   );
  // }

  static void showDarziPic(ImageUrl img) {
    showDialog(DarziProfilePic(
      url: img,
      addContraints: false,
    ));
  }

  static void showServicePic(ImageUrl img) {
    showDialog(ServicePic(url: img));
  }
}
