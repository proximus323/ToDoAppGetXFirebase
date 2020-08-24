import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
Auth import 'package:to_do_app/screens/home.dart';
import 'package:to_do_app/screens/login.dart';
import 'package:to_do_app/services/auth.dart';

class AuthController extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Rx<User> _user = Rx<User>();

  String get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    _user.bindStream(_firebaseAuth.authStateChanges());
  }

  Future<String> createUser(String _email, String _password) async {
    final String returnValue = await Auth(auth: _firebaseAuth).createAccount(
      email: _email,
      password: _password,
    );
    return returnValue;
  }

  Future<String> signIn(String _email, String _password) async {
    final String returnValue = await Auth(auth: _firebaseAuth).signIn(
      email: _email,
      password: _password,
    );
    if (returnValue == "Success") Get.to(Home());
  }

  void signOut() async {
    await Auth(auth: _firebaseAuth).signOut();
    _user = null;
    Get.offAll(Login());
  }
}
