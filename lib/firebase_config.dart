import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (kIsWeb) {
      // Web
      return const FirebaseOptions(
          apiKey: "AIzaSyASADvN1A88TqvGiAIQvYyaMYqMJUJfXaM",
          authDomain: "votingapp-512da.firebaseapp.com",
          projectId: "votingapp-512da",
          storageBucket: "votingapp-512da.appspot.com",
          messagingSenderId: "759585622978",
          appId: "1:759585622978:web:52598363c872eb1838645b",
          measurementId: "G-9R7BVK00BE");
    } /* else if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '1:448618578101:ios:2bc5c1fe2ec336f8ac3efc',
        apiKey: 'AIzaSyAHAsf51D0A407EklG1bs-5wA7EbyfNFg0',
        projectId: 'react-native-firebase-testing',
        messagingSenderId: '448618578101',
        iosBundleId: 'io.flutter.plugins.firebase.firestore.example',
        iosClientId:
            '448618578101-ja1be10uicsa2dvss16gh4hkqks0vq61.apps.googleusercontent.com',
        androidClientId:
            '448618578101-2baveavh8bvs2famsa5r8t77fe1nrcn6.apps.googleusercontent.com',
        storageBucket: 'react-native-firebase-testing.appspot.com',
        databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
      );
    } */
    else {
      // Android
      return const FirebaseOptions(
        appId: "1:759585622978:android:38e7116487b57a5338645b",
        apiKey: "AIzaSyASADvN1A88TqvGiAIQvYyaMYqMJUJfXaM",
        projectId: "votingapp-512da",
        messagingSenderId: "759585622978",
      );
    }
  }
}
