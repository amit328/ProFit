import 'package:flutter/material.dart';
import 'package:part5/service/http_Service.dart';
import 'package:part5/styleguide/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:part5/views/register_screen.dart';
class LoginScreen extends StatefulWidget {
  final Function toggleView;

  LoginScreen({this.toggleView});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username;

  String pass;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
    Scaffold(
           backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: Row(
            children: [
              Image.asset(
                'assets/applogo.png',
                fit: BoxFit.contain,
                height: 50,
              ),
              Text('ProFit', style: TextStyle(color: Colors.black, fontSize: 30),),
            ],
          ),
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
                  label: Text('Register'),
                  onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()));
            },
                ),
              ],
      ),
      body: Container(
                  child:SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
                "Login",
                 style: TextStyle(fontSize: 25),

            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
                "assets/icons/chat.svg",
                height: size.height * 0.4,
            ),
            SizedBox(height: size.height * 0.05),
            TextField(
              decoration: InputDecoration(hintText: 'Username'),
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
              onChanged: (value) {
                setState(() {
                  pass = value;
                });
              },
            ),
            SizedBox(height: size.height * 0.015),
            InkWell(
              onTap: () async {
                await HttpService.login(username, pass, context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Center(
                    child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
            ),
          ],
        ),
                  ),
      ),
    );
  }
}
