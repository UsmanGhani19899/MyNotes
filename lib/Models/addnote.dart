import 'package:cloud_firestore/cloud_firestore.dart';

class NotesModel {
  String? title;
  String? note;
  String? uid;
  bool? isDone;
  String? dateTime;
  String? selectedColor;

  NotesModel(
      {this.note,
      this.title,
      this.uid,
      this.selectedColor,
      this.dateTime,
      this.isDone});
  factory NotesModel.fromMap(map) {
    return NotesModel(
      uid: map['uid'] ?? "",
      title: map['title'] ?? "",
      note: map['note'] ?? "",
      selectedColor: map['selectedColor'] ?? "",
      isDone: map['isDone'] ?? "",
      dateTime: map['dateTime'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'note': note,
      'title': title,
      'selectedColor': selectedColor,
      'dateTime': dateTime,
      'isDone': isDone
    };
  }
}
