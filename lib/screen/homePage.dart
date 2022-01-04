// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_sample/screen/secondPage.dart';
import 'package:rxdart/rxdart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

int number = 0;
BehaviorSubject<int> subjectNumber = BehaviorSubject<int>();
sumNumber() {
  number++;
  subjectNumber.add(number);
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 5.0,
        onPressed: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (_) => SecondPage()));
        },
        child: Text('Second'),
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Welcome HomePage',
            style: TextStyle(fontSize: 50),
          ),
          StreamBuilder(
            stream: subjectNumber,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return Text(
                snapshot.data.toString(),
                style: TextStyle(fontSize: 50),
              );
            },
          )
        ],
      )),
    );
  }
}
