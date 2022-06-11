import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onlinetest/models/usermodel.dart';
import 'package:onlinetest/screens/login_page.dart';
import 'package:onlinetest/viewmodels/registerviewmodel.dart';

class RegisterPage extends StatefulWidget {

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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
                    "REGISTER",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0
                    ),
                  ),
                  SizedBox(height: 50),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.amber,),
                      hintText: 'Enter username: ',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.amber)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.amber,),
                      hintText: 'Enter password: ',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.amber)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: (){
                      User user = new User(
                          username: usernameController.text,
                          password: passwordController.text);
                      RegisterViewModel registerViewModel = new RegisterViewModel();

                      if (registerViewModel.register(user) != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      }
                    },
                    child: Text(
                        "REGISTER",
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
                          context, MaterialPageRoute(builder: (context) => LoginPage())
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "Have an account? ",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                            "Login here",
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

