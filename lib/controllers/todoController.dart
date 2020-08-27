import 'package:get/get.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/services/database.dart';

import 'authController.dart';

class TodoController extends GetxController {
  Rx<List<TodoModel>> todoList = Rx<List<TodoModel>>();

  List<TodoModel> get todos => todoList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    todoList.bindStream(DataBase().todoStream(uid));
  }
}
