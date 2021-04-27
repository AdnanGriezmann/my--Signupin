import 'package:flutter/material.dart';
import 'package:singnupp/pages/Signin.dart';
import 'package:singnupp/pages/Signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,       
        
      ),

      home: SignIn(),
      routes: <String, WidgetBuilder>{
       '/Signup': (BuildContext context) => SignUp(),
       '/Signin': (BuildContext context) => SignIn(),

      }
      
    );
  }
}