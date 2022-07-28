import 'package:compegwork/loginscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'decitionscreen.dart';
import 'firebase_config.dart';
import 'introductionscreen.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
/* const firebaseConfig = {

  apiKey: "AIzaSyDQiw66GzdU5uUj8n6VOMerY7TO8nFeLV4",

  authDomain: "funny-725eb.firebaseapp.com",

  projectId: "funny-725eb",

  storageBucket: "funny-725eb.appspot.com",

  messagingSenderId: "731022806056",

  appId: "1:731022806056:web:deb581e36d969df1c4f91d"

};
 */

/* apiKey: "AIzaSyASADvN1A88TqvGiAIQvYyaMYqMJUJfXaM",

  authDomain: "votingapp-512da.firebaseapp.com",

  projectId: "votingapp-512da",

  storageBucket: "votingapp-512da.appspot.com",

  messagingSenderId: "759585622978",

  appId: "1:759585622978:web:52598363c872eb1838645b",

  measurementId: "G-9R7BVK00BE"
 */

    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyASADvN1A88TqvGiAIQvYyaMYqMJUJfXaM",
        appId: "1:759585622978:web:52598363c872eb1838645b",
        messagingSenderId: "759585622978",
        projectId: "votingapp-512da",
        storageBucket: "votingapp-512da.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  //await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
  //1
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var vall = prefs.getBool('post');

  runApp(ProviderScope(
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: vall == null ? OnBoardingPage() : PickScreen()),
  ));
}
