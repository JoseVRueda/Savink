import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCXx9ZEsHe8FYhg6TZluOLCgoEtNDykcDs",
            authDomain: "ahorros-gastos-o3vn3r.firebaseapp.com",
            projectId: "ahorros-gastos-o3vn3r",
            storageBucket: "ahorros-gastos-o3vn3r.appspot.com",
            messagingSenderId: "806542841181",
            appId: "1:806542841181:web:635dcd820c76b4b16244b4"));
  } else {
    await Firebase.initializeApp();
  }
}
