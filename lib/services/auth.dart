import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Auth {
  final FirebaseAuth auth;
  Auth({this.auth});

  Future<String> createAccount({String email, String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return "Success";
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message, snackPosition: SnackPosition.BOTTOM);
      return e.message;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential> signIn({String email, String password}) async {
    try {
      UserCredential _authResult = await auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return _authResult;
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message, snackPosition: SnackPosition.BOTTOM);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  signOut() async {
    try {
      await auth.signOut();
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      rethrow;
    }
  }
}
