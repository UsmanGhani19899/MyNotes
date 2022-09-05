import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mynotes/Models/addnote.dart';
import 'package:intl/intl.dart';
import 'package:mynotes/Screens/add.dart';

class Database {
  FirebaseFirestore? firestore;
  final _auth = FirebaseAuth.instance;
  CollectionReference? _mainCollection;
  NotesModel? currentData;
  initiliase() {
    firestore = FirebaseFirestore.instance;
    _mainCollection = firestore!.collection('Requests');
  }

  addNotes(
      {BuildContext? context,
      String? title,
      String? note,
      String? selectedColor,
      String? date}) async {
    final _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    NotesModel newNote = NotesModel(
        note: note,
        title: title,
        uid: user!.uid,
        selectedColor: selectedColor,
        dateTime: formattedDate,
        isDone: false);
    await FirebaseFirestore.instance
        .collection('MyNotes')
        .add(newNote.toJson());
  }

  deleteNote(String id) async {
    await FirebaseFirestore.instance.collection('MyNotes').doc(id).delete();
  }

  noteDone(String id) async {
    await FirebaseFirestore.instance
        .collection('MyNotes')
        .doc(id)
        .update({'isDone': true});
  }
}
