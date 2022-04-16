import 'package:compegwork/loginscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'decitionscreen.dart';
import 'introductionscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //1
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var vall = prefs.getBool('post');

  runApp(ProviderScope(
    child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: vall == null ? OnBoardingPage() : PickScreen()),
  ));
}
