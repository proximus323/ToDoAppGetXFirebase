import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Rx<User> _user = Rx<User>();

  @override
  void onInit() {
    // TODO: implement onInit
    _user.bindStream(_firebaseAuth.authStateChanges());
  }

  createUser(String _email, String _password) {}
}
