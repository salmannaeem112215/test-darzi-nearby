import 'package:darzi_nearby/commons/commons.dart';

class Utility {
  static void showError(dynamic e) {
    String title = 'Error';
    String message = 'Error Occured';

    if (e is String) {
      message = e;
    }

    Get.showSnackbar(GetSnackBar(
      title: title,
      message: message,
      duration: const Duration(seconds: 1),
    ));
  }
}
