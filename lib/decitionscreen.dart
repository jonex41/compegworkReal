import 'package:compegwork/adminpage.dart';
import 'package:compegwork/loginscreen.dart';
import 'package:compegwork/mainscreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

class PickScreen extends StatefulWidget {
  @override
  State<PickScreen> createState() => _PickScreenState();
}

class _PickScreenState extends State<PickScreen> {
  final TextEditingController _controller = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>(debugLabel: '_GuestBookState');

  final snackBar = const SnackBar(
    content: Text('Wrong Password'),
  );

  var _myValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Voting App',
        ),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.3,
            child: Center(
              child: Image.asset(
                "assets/images/abu.png",
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width / 2.5,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Image.asset('assets/images/comp.jpeg', width: 200),
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: () {
                              showBottomDialog(context);
                            },
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              'Admin',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WelcomeScreen(),
                                ),
                              );
                            },
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              'Student',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _checkIfCorrect(BuildContext context) async {
    print('i am here now');
  }

  Future showBottomDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text(
              'Admin only',
            ),
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    obscureText: true,
                    decoration:
                        const InputDecoration(hintText: 'Enter Password'),
                    controller: _controller,
                    validator: (value) {
                      if (value == null || value.isEmpty || value != 'admin') {
                        return 'Enter right password';
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
                  Visibility(
                      visible: _myValue,
                      child: const Text(
                        'Wrong password!!',
                        style: TextStyle(color: Colors.red),
                      ))
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // await widget.addMessage(_controller.text);

                    Navigator.of(context).pop();
                    await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => AdminScreen()));
                    setState(() {});
                    _controller.clear();
                  }
                },
                child: const Text('Submit'),
              )
            ],
          ));
}
