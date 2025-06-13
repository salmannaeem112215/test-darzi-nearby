import 'package:darzi_nearby/api/darzi_nearby_api.dart';

abstract class MyApi {
  MyApi(this.api);
  final ServerApi api;

  FutureOr<T> adminOnly<T>(FutureOr<T> Function(dynamic admin) callback) async {
    if (!api.login.isLoggedIn) throw 'User not authenticated';

    final user = api.login.logedInUser!;
    // Check if the user is an admin
    DocumentSnapshot<dynamic> adminSnapshot =
        await api.firestore.collection('admins').doc(user.uid).get();

    if (!adminSnapshot.exists) {
      throw 'Only admin can perform this action.';
    }

    return await callback(adminSnapshot.data());
  }

  String handleError(dynamic e, String errMessage) {
    if (e is FirebaseAuthException) {
      return 'Email or Password is invalid';
      return e.message.toString(); // indicates error
    }

    if (e is FirebaseException) {
      return "Something went wrong";
      return e.message.toString(); // indicates error
    } else if (e is String) {
      return e;
    }
    return errMessage;
  }
}
