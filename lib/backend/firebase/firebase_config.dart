import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAKMiwwUY7ccGaPtccB8JjCyeEPboAbG0A",
            authDomain: "fullstack-flutterbase-demo.firebaseapp.com",
            projectId: "fullstack-flutterbase-demo",
            storageBucket: "fullstack-flutterbase-demo.appspot.com",
            messagingSenderId: "920066359550",
            appId: "1:920066359550:web:7bec619375e9fda43ca5af",
            measurementId: "G-JWHTDQC9PB"));
  } else {
    await Firebase.initializeApp();
  }
}
