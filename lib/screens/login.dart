import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/authController.dart';
import 'package:to_do_app/screens/signeup.dart';

class Login extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration: InputDecoration(
                    hintText: "Email", icon: Icon(Icons.mail_outline)),
              ),
              SizedBox(
                height: 18,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password", icon: Icon(Icons.lock_outline)),
              ),
              SizedBox(
                height: 18,
              ),
              RaisedButton(
                onPressed: () {
                  controller.signIn(
                      _emailController.text, _passwordController.text);
                },
                child: Text("Login"),
              ),
              FlatButton(
                  onPressed: () {
                    Get.to(SignUp());
                  },
                  child: Text("Sing Up"))
            ],
          ),
        ),
      ),
    );
  }
}
