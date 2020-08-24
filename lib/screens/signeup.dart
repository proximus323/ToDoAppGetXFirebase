import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/authController.dart';

class SignUp extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Signe Up"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                controller: _emailController,
                decoration: InputDecoration(
                    hintText: "Email", icon: Icon(Icons.mail_outline)),
              ),
              SizedBox(
                height: 18,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                autocorrect: false,
                decoration: InputDecoration(
                    hintText: "Password", icon: Icon(Icons.lock_outline)),
              ),
              SizedBox(
                height: 18,
              ),
              RaisedButton(
                onPressed: () {
                  final Future<String> returnValue = controller.createUser(
                      _emailController.text, _passwordController.text);
                  returnValue.then((value) {
                    if (value == "Success") {
                      _emailController.clear();
                      _passwordController.clear();
                      Get.back();
                    } else {
                      Get.snackbar("Error", value,
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  });
                },
                child: Text("Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
