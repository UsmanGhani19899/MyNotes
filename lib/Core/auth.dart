import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynotes/Models/userModel.dart';
import 'package:mynotes/Screens/add.dart';
import 'package:mynotes/Screens/bottombar.dart';
import 'package:mynotes/Screens/home.dart';
import 'package:mynotes/Screens/signIn.dart';

class Auth {
  final _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> _createfireStore(UserModel user, User _firebaseUser) async {
    await _db
        .collection('Users')
        .doc('${_firebaseUser.uid}')
        .set(user.toJson());
  }

  Signin(BuildContext context, String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Get.off(BottomBar()));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }
  }

  SignUp(
      BuildContext context, String email, String password, String name) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((result) async {
        UserModel newUser = UserModel(
            email: result.user!.email!, name: name, uid: result.user!.uid);
        await _createfireStore(newUser, result.user!)
            .then((value) => {Get.off(BottomBar())});
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }
  }

  logout() async {
    await _auth.signOut().then((value) => Get.off(SignIn()));
  }
}
