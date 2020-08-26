import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/authController.dart';
import 'package:to_do_app/controllers/userController.dart';
import 'package:to_do_app/screens/home.dart';
import 'package:to_do_app/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: GetX(
            initState: (state) => {
                  Get.put<UserController>(UserController()),
                  Get.put<AuthController>(AuthController())
                },
            init: AuthController(),
            builder: (_) {
              return (_.user != null) ? Home() : Login();
            }));
  }
}
