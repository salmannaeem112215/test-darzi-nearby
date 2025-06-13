import 'package:darzi_nearby/api/darzi_nearby_api.dart';

extension UserCredentialX on UserCredential {
  Future<String?> get token async => await user?.getIdToken();
  String? get uid => user?.uid;
}

class LoginApi extends MyApi {
  LoginApi(super.api);

  User? get logedInUser => api.auth.currentUser;
  bool get isLoggedIn => logedInUser != null;

  CollectionReference get coll => api.firestore.collection('admins');
  DocumentReference adminDoc(String uid) => coll.doc(uid);

  Future<void> _addAdminDoc(
      LoginInfo login, UserCredential userCredential) async {
    final uid = userCredential.uid;
    final token = await userCredential.token;
    await adminDoc(uid!).set({
      'email': login.email.value,
      'password': login.password.value,
      'token': token,
    });
  }

  Future<void> _updateAdminToken(UserCredential userCredential) async {
    final token = await userCredential.token;

    await adminDoc(userCredential.user!.uid).update({
      'token': token,
    });
  }

  Future<String?> signUp(LoginInfo login) async {
    try {
      login.throwIfNotValid();

      // Before creating check that user already exist or not
      // admin not exit with that loginInfo so create it
      UserCredential userCredential =
          await api.auth.createUserWithEmailAndPassword(
        email: login.email.value,
        password: login.password.value,
      );

      await _addAdminDoc(login, userCredential);
      return null; // indicates user created
    } catch (e) {
      return handleError(e, "Account not created");
    }
  }

  Future<String?> login(LoginInfo login) async {
    try {
      login.throwIfNotValid();
      UserCredential userCredential = await api.auth.signInWithEmailAndPassword(
        email: login.email.value,
        password: login.password.value,
      );

      await _updateAdminToken(userCredential);

      return null;
    } catch (e) {
      return handleError(e, "Account not Login");
    }
  }

  Future<void> logout() async {
    await api.auth.signOut();
  }
}
