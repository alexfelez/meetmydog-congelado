import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAxn1gU3QMObIocMQh64H8SqociHWoWwHk",
            authDomain: "meetmydog---proyecto.firebaseapp.com",
            projectId: "meetmydog---proyecto",
            storageBucket: "meetmydog---proyecto.firebasestorage.app",
            messagingSenderId: "818368654661",
            appId: "1:818368654661:web:ab63bb28ee6d3ce46fa22c",
            measurementId: "G-TXEP3CFFT6"));
  } else {
    await Firebase.initializeApp();
  }
}
