import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/models/todo.dart';
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

  Future<void> addTodo(String content, String uid) async {
    try {
      await _firestore.collection("users").doc(uid).collection("todos").add(
          {'dateCreated': Timestamp.now(), 'content': content, 'done': false});
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<TodoModel>> todoStream(String uid) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('todos')
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<TodoModel> retVal = List();
      querySnapshot.docs.forEach((element) {
        retVal.add(TodoModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }
}
