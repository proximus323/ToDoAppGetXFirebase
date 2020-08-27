import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/userController.dart';
import 'package:to_do_app/models/user.dart';
import 'package:to_do_app/screens/home.dart';
import 'package:to_do_app/screens/login.dart';
import 'package:to_do_app/services/auth.dart';
import 'package:to_do_app/services/database.dart';

class AuthController extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Rx<User> _user = Rx<User>();
  User get user => _user.value;

  //String get user => _user.value?.email;

  @override
  void onInit() {
    _user.bindStream(_firebaseAuth.authStateChanges());
  }

  createUser(String _name, String _email, String _password) async {
    await Auth(auth: _firebaseAuth).createAccount(
      email: _email,
      password: _password,
    );
    UserModel _userModel = UserModel();
    _userModel.id = _firebaseAuth.currentUser.uid;
    _userModel.name = _name;
    _userModel.email = _email;

    if (await DataBase().createNewUser(_userModel)) {
      Get.find<UserController>().user = _userModel;
      Get.back();
    }
  }

  signIn(String _email, String _password) async {
    await Auth(auth: _firebaseAuth)
        .signIn(
          email: _email,
          password: _password,
        )
        .then((value) => () async {
              Get.find<UserController>().user =
                  await DataBase().getUser(value.user.uid);
              if (value != null) Get.to(Home());
            });
  }

  void signOut() async {
    await Auth(auth: _firebaseAuth).signOut();
    Get.find<UserController>().clear();
    Get.off(Login());
  }
}
