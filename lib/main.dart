import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynotes/Screens/home.dart';
import 'package:mynotes/Screens/splash.dart';

import 'Screens/signUp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyNotes());
}

class MyNotes extends StatelessWidget {
  const MyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
