// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_sample/screen/homePage.dart';
import 'package:rxdart/rxdart.dart';
import 'package:email_validator/email_validator.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var subjectValidFormState = BehaviorSubject<bool>();
  GlobalKey<FormState>formState = GlobalKey<FormState>();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  BehaviorSubject<bool> subjectHidePassword = BehaviorSubject<bool>();
  bool _boolHidePassword = false;
  @override
  void dispose() {
   subjectHidePassword.close();
    super.dispose();
  }
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
                        height: 254,
                        child: Form(
                          key: formState,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (){
                            bool _isValidFormState = formState.currentState!.validate();
                            subjectValidFormState.add(_isValidFormState);
                          },
                            child: Column(
                          children: [
                            TextFormField(
                              validator: (val){
                                  if(val == null || val.isEmpty){
                                    return "សូមបញ្ចូល E-mail ជាដាច់ខាត !";
                                  }
                                  else if(val.isNotEmpty && !EmailValidator.validate(val) ){
                                    return "សូមបញ្ចូលជាទម្រុង E-mail !";
                                  }
                                  return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'E-mail Address*',
                                  // hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),

                                  fillColor: Colors.grey.withOpacity(0.3),
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(12.0))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            StreamBuilder(
                              initialData: true,
                              stream: subjectHidePassword,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                return TextFormField(
                                  validator: (val){
                                    if(val==null ||val.isEmpty){
                                      return "សូមបញ្ចូល លេខសម្ងាត់ជាដាច់ខាត !";
                                    }
                                    return null;
                                  },
                                  obscureText: snapshot.data,
                                  decoration: InputDecoration(
                                      suffixIcon: ElevatedButton(
                                          onPressed: () {
                                             _boolHidePassword = ! _boolHidePassword;
                                            subjectHidePassword.add(_boolHidePassword);
                                          },
                                          child: Container(
                                            child: Icon(
                                                Icons.visibility_off_outlined),
                                          )),
                                      hintText: 'Password*',
                                      fillColor: Colors.grey.withOpacity(0.3),
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(12.0))),
                                );
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                           StreamBuilder(
                             stream: subjectValidFormState,
                             initialData: false,
                             builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
                            bool _isValidForm = snapshot.data;
                             return  ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => Color(0xff9B72FD))),
                                onPressed: _isValidForm ?(){
                                  Navigator.push(context, CupertinoPageRoute(builder: (_)=>HomePage()));
                                }: null,
                                child: Container(
                                  width: 300,
                                  height: 45,
                                  child: Center(
                                    child: Text(
                                      'Login now',
                                      style:
                                          GoogleFonts.varelaRound(fontSize: 17),
                                    ),
                                  ),
                                ));
                            },)
                          ],
                        ))),
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
