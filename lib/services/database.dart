import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/models/user.dart';

class DataBase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot docSnapShot =
          await _firestore.collection("users").doc(uid).get();
      return UserModel.fromDocumentSnapshot(docSnapShot);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
