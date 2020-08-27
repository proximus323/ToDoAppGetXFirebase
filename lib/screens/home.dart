import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/controllers/authController.dart';
import 'package:to_do_app/controllers/datetimeController.dart';
import 'package:to_do_app/controllers/todoController.dart';
import 'package:to_do_app/controllers/userController.dart';
import 'package:to_do_app/services/database.dart';

import '../controllers/authController.dart';
import '../controllers/authController.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetX<UserController>(
          initState: (_) async {
            Get.find<UserController>().user =
                await DataBase().getUser(Get.find<AuthController>().user.uid);
          },
          builder: (_) {
            return Text("Hello " + _.user.name);
          },
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Get.find<AuthController>().signOut();
                },
                child: Icon(
                  Icons.exit_to_app,
                  size: 26.0,
                ),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DataBase().addTodo("content", Get.find<AuthController>().user.uid);
        },
        backgroundColor: Colors.yellow[600],
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      GetX<DateTimeController>(
                        builder: (_) {
                          return Text(
                            DateFormat("EEEE").format(_.currentDate.value),
                            style: GoogleFonts.lato(
                                fontSize: 36, fontWeight: FontWeight.w700),
                          );
                        },
                      ),
                      GetX<DateTimeController>(
                        builder: (_) {
                          return Text(
                            _.getCurrentData(),
                            style: GoogleFonts.lato(
                                fontSize: 18, fontWeight: FontWeight.w300),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                    height: 35,
                    minWidth: 50,
                    elevation: 2,
                    padding: EdgeInsets.all(0),
                    shape:
                        CircleBorder(side: BorderSide(color: Colors.grey[300])),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey[300],
                      size: 18,
                    ),
                    onPressed: () {
                      Get.find<DateTimeController>().changeDate(false);
                    }),
                MaterialButton(
                    height: 50,
                    elevation: 0,
                    minWidth: 50,
                    padding: EdgeInsets.all(0),
                    shape:
                        CircleBorder(side: BorderSide(color: Colors.grey[300])),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[300],
                      size: 24,
                    ),
                    onPressed: () {
                      Get.find<DateTimeController>().changeDate(true);
                    }),
              ],
            ),
            GetX<TodoController>(
              init: Get.put(TodoController()),
              builder: (TodoController todoController) {
                if (todoController != null && todoController.todos != null) {
                  return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: todoController.todos.length,
                          itemBuilder: (_, index) {
                            return Card(
                              elevation: 4.0,
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[
                                    Text(todoController.todos[index].dateCreated
                                        .toDate()
                                        .toString()),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    Text(todoController.todos[index].content),
                                    Checkbox(
                                      value: todoController.todos[index].done,
                                      onChanged: (bool value) {
                                        todoController.todos[index].done =
                                            value;
                                      },
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }));
                } else {
                  return Text("No found any elements do display ");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
