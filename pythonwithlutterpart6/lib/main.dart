import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:part5/views/welcome_screen.dart';
import 'package:part5/views/login_screen.dart';
// import 'package:part5/views/dashboardScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      builder: EasyLoading.init(),
    );
  }
}
