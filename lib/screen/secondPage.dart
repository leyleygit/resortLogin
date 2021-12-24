// ignore_for_file: prefer_const_constructors, file_names
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);
  
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SecondPage',
              style: TextStyle(fontSize: 50),
            ),
            ElevatedButton(onPressed: (){}, child: Text('SumNumber'))
          ],
        ),
      ),
    );
  }
}
