import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String content;
  String todoId;
  Timestamp dateCreated;
  bool done;

  TodoModel({content, todoId, dateCreated, done});

  TodoModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    todoId = documentSnapshot.id;
    content = documentSnapshot.data()["content"];
    dateCreated = documentSnapshot.data()["dateCreated"];
    done = documentSnapshot.data()["done"];
  }
}
