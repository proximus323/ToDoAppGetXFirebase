import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/screens/signeup.dart';

class Login extends StatelessWidget {
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
                decoration: InputDecoration(
                    hintText: "Email", icon: Icon(Icons.mail_outline)),
              ),
              SizedBox(
                height: 18,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Password", icon: Icon(Icons.lock_outline)),
              ),
              SizedBox(
                height: 18,
              ),
              RaisedButton(
                onPressed: () {},
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
