import 'package:fetchapi/homepage.dart';
import 'package:fetchapi/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Signup',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignupPage(users: users),
    );
  }
}
