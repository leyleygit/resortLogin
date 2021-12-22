// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children:
              //body
              [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/imgs/login2.jpg'),
                      fit: BoxFit.fill)),
            ),
            //login
            Positioned(
              right: 0,
              child: Container(
                width: 450,
                height: 820,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(9),
                        topLeft: Radius.circular(9))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //logo
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/imgs/logo.png'))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Sign in',
                      style: GoogleFonts.varelaRound(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    //form
                    Container(
                      width: 330,
                      height: 230,
                      child: Form(
                          child: Column(
                        children: [
                          //Email
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: 'E-mail Address*' ,
                                // hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                
                                fillColor: Colors.grey.withOpacity(0.3),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(12.0))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Password*' ,
                                fillColor: Colors.grey.withOpacity(0.3),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(12.0))),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Color(0xff9B72FD))),
                              onPressed: () {},
                              child: Container(
                                width: 300,
                                height: 45,
                                child: Center(
                                  child: Text(
                                    'Login now',
                                    style: GoogleFonts.varelaRound(fontSize: 17),
                                  ),
                                ),
                              ))
                        ],
                      )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
