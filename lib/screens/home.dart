import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/authController.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Get.find<AuthController>().signOut();
                },
                child: Icon(
                  Icons.lock_open,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Center(),
    );
  }
}
