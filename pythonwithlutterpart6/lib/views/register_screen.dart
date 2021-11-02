import 'dart:math';

import 'package:flutter/material.dart';
import 'package:part5/service/http_Service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String username;

  String email;

  String pass;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Login Screen'),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Form(
              key: formkey,
              child: Column(
                children: <Widget>[
                  Container(
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Username is invalid!';
                        }
                      },
                      decoration: InputDecoration(hintText: 'username'),
                      onChanged: (value) {
                        setState(() {
                          username = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      validator: (value) {
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'Invalid Email!';
                        }
                      },
                      decoration: InputDecoration(hintText: 'email'),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      validator: (value) {
                        if (!RegExp(
                                "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}\$")
                            .hasMatch(value)) {
                          return 'Password should contain at least \none upper case \none lower case \none digit \none Special character \n8 characters in length.';
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(hintText: 'Password'),
                      onChanged: (value) {
                        setState(() {
                          pass = value;
                        });
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        if (formkey.currentState.validate()) {}
                        ;
                      });
                      await HttpService.register(username, email, pass, context);
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Center(
                          child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                    ),
                  ),
                ],
              ),
            )));
  }
}
