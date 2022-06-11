import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:onlinetest/screens/home_page.dart';
import 'package:onlinetest/models/usermodel.dart';
import 'package:onlinetest/screens/register_page.dart';
import 'package:onlinetest/viewmodels/loginviewmodel.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "LOGIN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0
                  ),
                ),
                SizedBox(height: 50),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    prefixIcon: Icon(Icons.person, color: Colors.amber,),
                    hintText: 'Enter username: ',
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.amber,),
                    hintText: 'Enter password: ',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: (){
                    User user = new User(
                        username: usernameController.text,
                        password: passwordController.text);
                    LoginViewModel loginViewModel = new LoginViewModel();

                    if (loginViewModel.login(user) == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    primary: Colors.amber,
                  ),
                ),
                SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => RegisterPage())
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        "Register here",
                        style: TextStyle(color: Colors.amber),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
