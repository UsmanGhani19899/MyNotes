import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynotes/Screens/bottombar.dart';
import 'package:mynotes/Screens/home.dart';
import 'package:mynotes/Screens/signIn.dart';
import 'package:mynotes/Screens/signUp.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

FirebaseAuth auth = FirebaseAuth.instance;
User? user = auth.currentUser;

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      if (user != null) {
        Get.off(BottomBar());
      } else {
        Get.off(SignIn());
      }
      // Get.off(SignUp());
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('My\nNote',
            style: GoogleFonts.roboto(
                color: Colors.green,
                fontWeight: FontWeight.w900,
                fontSize: 75)),
      ),
    );
  }
}
