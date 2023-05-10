import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:nb_utils/nb_utils.dart' hide Loader;

import 'mainscreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: 'SanFrancisco',
        ),
        home: const LoginScreen());
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  final TextEditingController newPasswordcontroller = TextEditingController();
  final TextEditingController regcontroller = TextEditingController();
  final TextEditingController messagecontroller = TextEditingController();
  bool _isObscure = true;
  bool _isVisible = false;
  final bool _showProgress = false;
  final _formKey = GlobalKey<FormState>(debugLabel: '_GuestBookState');
  final _dialogKey = GlobalKey<FormState>(debugLabel: '_GuestBookState');
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildImage(String assetName, [double width = 200]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(255, 14, 82, 10),
      body: SingleChildScrollView(
        reverse: true,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Login text Widget
            Center(
              child: Container(
                height: 200,
                width: 400,
                alignment: Alignment.center,
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                  // textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(
              height: 60,
              width: 10,
            ),

            // Wrong Password text
            Visibility(
              visible: _isVisible,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  "Wrong credentials entered",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 10,
                  ),
                ),
              ),
            ),

            // Textfields for username and password fields
            Container(
              height: 210,
              width: 530,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onTap: () {
                          setState(() {
                            _isVisible = false;
                          });
                        },
                        controller: nameController, // Controller for Username
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Reg. No",
                            contentPadding: EdgeInsets.all(10)),
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Reg, No';
                          }
                          return null;
                        },
                      ),
                    ),
                    const Divider(
                      thickness: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onTap: () {
                          setState(() {
                            _isVisible = false;
                          });
                        },

                        controller: levelController, // Controller for Password
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Password",
                            contentPadding: const EdgeInsets.all(10),
                            // Adding the visibility icon to toggle visibility of the password field
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            )),
                        obscureText: _isObscure,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter right Level';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Submit Button
            Container(
              width: 570,
              height: 70,
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  child: const Text("Submit",
                      style: TextStyle(color: Colors.white)),
                  /*  : RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)), */
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ))),
                  onPressed: () {
                    /*Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) =>  MainScreen()),
                          );*/
                    doMethod();

                    /* if (auth.fetchCredentials(
                              usernameController.text, passwordController.text)) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                                  (Route<dynamic> route) => false,
                            );
                          } else {
                            setState(() {
                              _isVisible = true;
                            });
                          }*/
                  }),
            ),

            // Register
            Container(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Center(
                  child: Row(
                    children: [
                      const Text("Dont have an account? ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          )),
                      GestureDetector(
                        onTap: () {
                          showContactAdmin(context);
                        },
                        child: Text("Contact Admin ",
                            style: TextStyle(
                              color: Colors.green[500],
                              fontSize: 15,
                            )),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              "COMPEG Voting System",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          )),
    );
  }

  Future<void> doThis(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('id', id);
  }

  @override
  void dispose() {
    Loader.hide();

    super.dispose();
  }

  void doTheCheckStuff() {}

  void showprogressBar(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Checking...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void doMethod() async {
    final prefs = await SharedPreferences.getInstance();
    doTheCheckStuff();
    if (_formKey.currentState!.validate()) {
      // await widget.addMessage(_controller.text);
      Loader.show(context,
          progressIndicator: const CircularProgressIndicator());
      bool ggggg = false;
      FirebaseFirestore.instance
          .collection('Users')
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          String name = doc["regno"];
          String level = doc["password"];

          if (nameController.text.trim().toLowerCase() == name.toLowerCase() &&
              levelController.text.trim().toLowerCase() ==
                  level.toLowerCase()) {
            //Navigator.pop(context);
            doThis(doc.id);
            Loader.hide();
            ggggg = true;

            prefs.setString('ids', doc.id);
            if (level == "password") {
              showBottomDialog(context, doc.id);
            } else {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => MainScreen()),
              );
              setState(() {});
              newPasswordcontroller.clear();
            }

            continue;
          }
        }
        if (!ggggg) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Please enter a valid Credentials')));
        }
      }).whenComplete(() {
        Loader.hide();
      });
    }
  }

  Future showBottomDialog(BuildContext context, String id) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text(
              'Enter new Password',
            ),
            content: Form(
              key: _dialogKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'Enter new Password'),
                    controller: newPasswordcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter password';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      if (val.length > 3) {
                        /* setState(() {
                          _myValue = true;
                        });*/
                      }
                    },
                  ),
                  /*  Visibility(
                      visible: _myValue,
                      child: const Text(
                        'Wrong password!!',
                        style: TextStyle(color: Colors.red),
                      )) */
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  if (_dialogKey.currentState!.validate()) {
                    // await widget.addMessage(_controller.text);
                    FirebaseFirestore.instance.collection('Users').doc(id).set(
                        {'password': newPasswordcontroller.text},
                        SetOptions(merge: true)).then((value) {
                      Navigator.of(context).pop();

                      /*  await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => AdminScreen())); */
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => MainScreen()),
                      );
                      setState(() {});
                      newPasswordcontroller.clear();
                    }).catchError(() {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Unable to update Password')));
                    });
                  }
                },
                child: const Text('Submit'),
              )
            ],
          ));

  Future showContactAdmin(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text(
              'Enter Message',
            ),
            content: Form(
              key: _dialogKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Reg No.'),
                    controller: regcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Reg No.';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      if (val.length > 3) {
                        /* setState(() {
                          _myValue = true;
                        });*/
                      }
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'Enter Message'),
                    controller: messagecontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Message';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      if (val.length > 3) {
                        /* setState(() {
                          _myValue = true;
                        });*/
                      }
                    },
                  ),

                  /*  Visibility(
                      visible: _myValue,
                      child: const Text(
                        'Wrong password!!',
                        style: TextStyle(color: Colors.red),
                      )) */
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  if (_dialogKey.currentState!.validate()) {
                    // await widget.addMessage(_controller.text);
                    Loader.show(
                      context,
                    );
                    await FirebaseFirestore.instance
                        .collection('Complaint')
                        .add(
                      {
                        'Regno': regcontroller.text,
                        'Message': messagecontroller.text
                      },
                    );
                    Loader.hide();
                    /*  snackBar(context,
                        content: const Text('Complaint sent Successfully')); */
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Complaint sent Successfully')));
                    setState(() {});
                    Navigator.of(context).pop();
                    /* .then((value) {
                     
                      /*  await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => AdminScreen())); */
                    }).catchError(() {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Unable to send Message')));
                    }); */
                  }
                },
                child: const Text('Submit'),
              )
            ],
          ));
}

/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                  height: 400,
                  width: 200,
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Text(
                    "Successfull login!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
            ),
            Container(
              height: 100,
              width: 570,
              padding: EdgeInsets.all(20),
              child: RaisedButton(
                  color: Colors.pink,
                  child: Text("Logout", style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                          (Route<dynamic> route) => false,
                    );
                  }),
            )
          ],
        ));
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
      body: SignupPageContent(),
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Company name, Inc",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}

class SignupPageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignupPageContent();
}

class _SignupPageContent extends State<SignupPageContent> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  bool _isVisible = false;
  bool _isObscure1 = true;
  bool _isObscure2 = true;
  String returnVisibilityString = "";

  bool returnVisibility(String password1, String password2, String username) {
    if (password1 != password2) {
      returnVisibilityString = "Passwords do not match";
    } else if (username == "") {
      returnVisibilityString = "Username cannot be empty";
    } else if (password1 == "" || password2 == "") {
      returnVisibilityString = "Password fields cant be empty";
    } else if (!auth.isPasswordCompliant(password1)) {
      returnVisibilityString = "Not password compliant";
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Sized Box
          SizedBox(
            height: 37.5,
            width: 400,
          ),

          // Signup Text
          Center(
            child: Container(
              height: 245,
              width: 400,
              alignment: Alignment.center,
              child: Text(
                "Signup",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Wrong password text
          Visibility(
            visible: _isVisible,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                returnVisibilityString,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 10,
                ),
              ),
            ),
          ),

          // Signup Info
          Container(
            height: 215,
            width: 530,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white),
            child: Column(
              children: <Widget>[
                TextFormField(
                  onTap: () {
                    setState(() {
                      _isVisible = false;
                    });
                  },
                  controller: usernameController, // Controller for Username
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Username",
                      contentPadding: EdgeInsets.all(20)),
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                ),
                Divider(
                  thickness: 3,
                ),
                TextFormField(
                  onTap: () {
                    setState(() {
                      _isVisible = false;
                    });
                  },

                  controller: passwordController1, // Controller for Password
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      contentPadding: EdgeInsets.all(20),
                      // Adding the visibility icon to toggle visibility of the password field
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure1
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isObscure1 = !_isObscure1;
                          });
                        },
                      )),
                  obscureText: _isObscure1,
                ),
                Divider(
                  thickness: 3,
                ),
                TextFormField(
                  onTap: () {
                    setState(() {
                      _isVisible = false;
                    });
                  },

                  controller: passwordController2, // Controller for Password
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Re-enter Password",
                      contentPadding: EdgeInsets.all(20),
                      // Adding the visibility icon to toggle visibility of the password field
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure2
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isObscure2 = !_isObscure2;
                          });
                        },
                      )),
                  obscureText: _isObscure2,
                ),
              ],
            ),
          ),

          // Signup Submit button
          Container(
            width: 570,
            height: 70,
            padding: EdgeInsets.only(top: 20),
            child: RaisedButton(
                color: Colors.pink,
                child: Text("Submit", style: TextStyle(color: Colors.white)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () async {
                  if (kDebugMode) {
                    print(
                        "Username: ${usernameController.text}\npassword: ${passwordController1.text}\nretry password ${passwordController2.text}");
                  }

                  if (usernameController.text != "" &&
                      passwordController1.text == passwordController2.text &&
                      passwordController2.text != "" &&
                      auth.isPasswordCompliant(passwordController1.text)) {
                    print("I got in here");
                    if (!auth.checkUserRepeat(usernameController.text)) {
                      auth.insertCredentials(
                          usernameController.text, passwordController1.text);

                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => MyApp()),
                            (Route<dynamic> route) => false,
                      );
                    } else {
                      setState(() {
                        returnVisibilityString = "Username already exists";
                        _isVisible = true;
                      });
                    }
                  } else {
                    setState(() {
                      _isVisible = returnVisibility(passwordController1.text,
                          passwordController2.text, usernameController.text);
                    });
                  }
                }),
          ),
        ],
      ),
    );
  }
}
*/
