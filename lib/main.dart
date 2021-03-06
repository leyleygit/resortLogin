import 'package:flutter/material.dart';
import 'package:login_sample/screen/createUser.dart';
import 'package:login_sample/screen/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateUser(),
    );
  }
}
