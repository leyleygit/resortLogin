import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:rxdart/rxdart.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController pwdController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  BehaviorSubject<bool> subjectHidePassword = BehaviorSubject<bool>();
  bool _boolHidePassword = true;
  @override
  void dispose() {
    subjectHidePassword.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        backgroundColor: Colors.white,
        // ignore: prefer_const_constructors
        body: Container(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: const Color(0xff6200EE),
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'បង្កើតគណនី',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.supervisor_account_sharp,
                      size: 40,
                    )
                  ],
                ),
              ),
              Form(
                child: SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 250, vertical: 50),
                      child: Container(
                        height: 750,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: const [
                            BoxShadow(color: Color(0xffdadada), blurRadius: 5.0)
                          ],
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'ចុះឈ្មោះជាមួយនឹង E-mail របស់អ្នក',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 90),
                              child: Container(
                                height: 200,
                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: 1,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 300,
                                        decoration: BoxDecoration(
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Color(0xffdadada),
                                                  blurRadius: 5.0)
                                            ],
                                            gradient: const LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment(0.8, 0.0),
                                                colors: [
                                                  Color(0xff8E2DE2),
                                                  Color(0xff4A00E0)
                                                ]),
                                            borderRadius:
                                                BorderRadius.circular(11)),
                                        child: const Center(
                                          child: Icon(Icons.photo_camera_back,
                                              color: Colors.white, size: 40),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 40, horizontal: 100),
                              child: TextFormField(
                                controller: nameController,
                                style: const TextStyle(height: 1.5),
                                decoration: InputDecoration(
                                    hintText: "ឈ្មោះរបស់អ្នក",
                                    hintStyle: const TextStyle(fontSize: 20),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 100),
                              child: TextFormField(
                                controller: emailController,
                                style: const TextStyle(height: 1.5),
                                decoration: InputDecoration(
                                    hintText: "E-mail របស់អ្នក",
                                    hintStyle: const TextStyle(fontSize: 20),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 40, horizontal: 100),
                                child: StreamBuilder(
                                  stream: subjectHidePassword,
                                  initialData: true,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<dynamic> snapshot) {
                                    return TextFormField(
                                      controller: pwdController,
                                      style: const TextStyle(height: 1.5),
                                      obscureText: snapshot.data,
                                      decoration: InputDecoration(
                                          suffixIcon: InkWell(
                                            onTap: () {
                                              setState(() {
                                                _boolHidePassword =
                                                    !_boolHidePassword;
                                              });
                                              subjectHidePassword
                                                  .add(_boolHidePassword);
                                            },
                                            child: Icon(
                                                Icons.remove_red_eye_outlined),
                                          ),
                                          hintText: "Password***    របស់អ្នក",
                                          hintStyle:
                                              const TextStyle(fontSize: 20),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0))),
                                    );
                                  },
                                )),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xff6200EE))),
                                onPressed: () {},
                                child: Container(
                                  width: 500,
                                  height: 70,
                                  child: const Center(
                                    child: Text(
                                      'ចុះឈ្មោះឥលូវនេះ',
                                      style: TextStyle(fontSize: 23),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
