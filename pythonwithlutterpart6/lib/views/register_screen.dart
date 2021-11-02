import 'dart:math';

import 'package:flutter/material.dart';
import 'package:part5/service/http_Service.dart';
import 'package:part5/styleguide/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:part5/views/login_screen.dart';
class RegisterScreen extends StatefulWidget {
    final Function toggleView;

  RegisterScreen({this.toggleView});
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
        Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
           backgroundColor: Colors.blue[400],
           elevation: 0.0,
          title: Text('Register Screen'),
              actions: <Widget>[
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[400]), //Background Color
                    elevation: MaterialStateProperty.all(0), //Defines Elevation
                    // shadowColor:
                    //     MaterialStateProperty.all(brown), //Defines shadowColor
                  ),
                  icon: Icon(Icons.person),
                  label: Text('Login'),
                  onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
                ),
              ],
        ),
        body: Container(
           padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),

            child: Form(
              key: formkey,
              child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                "Register",
                 style: TextStyle(fontSize: 25),

            ),
             SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
                "assets/icons/chat.svg",
                height: size.height * 0.4,
            ),
                 SizedBox(height: size.height * 0.05),
                  Container(
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Username is invalid!';
                        }

                          return null;

                      },
                      decoration: InputDecoration(hintText: 'Username'),
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
                        return null;
                      },
                      decoration: InputDecoration(hintText: 'Email'),
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
                        }return null;
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
