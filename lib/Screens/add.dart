import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mynotes/Core/auth.dart';
import 'package:mynotes/Core/database.dart';
import 'package:mynotes/Models/colorsModel.dart';
import 'package:mynotes/Screens/home.dart';
import 'package:mynotes/Screens/signIn.dart';
import 'package:mynotes/Screens/signUp.dart';
import 'package:mynotes/Widgets/customeFields.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

Auth auth = Auth();
Database database = Database();
int? selectedColor;
final _formKey = GlobalKey<FormState>();
TextEditingController titleController = TextEditingController();
TextEditingController noteController = TextEditingController();

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.1),
                  child: Text('Add Note',
                      style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 45)),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomeField(
                        controller: titleController,
                        fieldName: 'Title',
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomeField(
                        controller: noteController,
                        fieldName: 'Note',
                        maxlines: 6,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40),
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: colorsModel.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColor = index;
                            });
                            print(selectedColor);
                          },
                          child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.16,
                              color: colorsModel[index].color),
                        );
                      }),
                ),
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 40),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       Container(
                //         height: MediaQuery.of(context).size.height * 0.08,
                //         width: MediaQuery.of(context).size.width * 0.16,
                //         color: Colors.red,
                //       ),
                //       Container(
                //         height: MediaQuery.of(context).size.height * 0.08,
                //         width: MediaQuery.of(context).size.width * 0.16,
                //         color: Colors.orange,
                //       ),
                //       Container(
                //         height: MediaQuery.of(context).size.height * 0.08,
                //         width: MediaQuery.of(context).size.width * 0.16,
                //         color: Colors.green,
                //       ),
                //       Container(
                //         height: MediaQuery.of(context).size.height * 0.08,
                //         width: MediaQuery.of(context).size.width * 0.16,
                //         color: Colors.amber,
                //       ),
                //       Container(
                //         height: MediaQuery.of(context).size.height * 0.08,
                //         width: MediaQuery.of(context).size.width * 0.16,
                //         color: Colors.blue,
                //       ),
                //     ],
                //   ),
                // ),

                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: HexColor('68fe9a'),
                          shape: RoundedRectangleBorder()),
                      onPressed: () {},
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: HexColor('68fe9a'),
                          shape: RoundedRectangleBorder()),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          database.addNotes(
                              context: context,
                              note: noteController.text,
                              title: titleController.text,
                              selectedColor: selectedColor == 0
                                  ? '#F8B195'
                                  : selectedColor == 1
                                      ? '#F67280'
                                      : selectedColor == 2
                                          ? '#99B898'
                                          : selectedColor == 3
                                              ? '#2A363B'
                                              : selectedColor == 4
                                                  ? '#A8E6CE'
                                                  : '#FFFFFF');

                          Get.off(Home(
                              color: selectedColor == 0
                                  ? '#F8B195'
                                  : selectedColor == 1
                                      ? '#F67280'
                                      : selectedColor == 2
                                          ? '#99B898'
                                          : selectedColor == 3
                                              ? '#2A363B'
                                              : selectedColor == 4
                                                  ? '#A8E6CE'
                                                  : Container()));
                        } else {}
                      },
                      child: Text(
                        'Save',
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
