// import 'package:feather_icons/feather_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';

// class EditNote extends StatefulWidget {
// String? title;
// String? note;
//   EditNote({super.key, this.note, this.title});

//   @override
//   State<EditNote> createState() => _EditNoteState();
// }

// class _EditNoteState extends State<EditNote> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//             margin: EdgeInsets.symmetric(horizontal: 10),
//             child: Container(
//               margin: EdgeInsets.only(top: 25, bottom: 25),
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       IconButton(
//                           onPressed: () {
//                             showDialog(
//                                 context: context,
//                                 builder: (context) {
//                                   return AlertDialog(
//                                     content: Container(
//                                       color: Colors.white,
//                                       height:
//                                           MediaQuery.of(context).size.height *
//                                               0.5,
//                                     ),
//                                   );
//                                 });
//                           },
//                           icon: Icon(
//                             Icons.edit,
//                             color: Colors.white,
//                           )),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         child: Text(
//                           '${widget.title} ',
//                           style: GoogleFonts.roboto(
//                               fontSize: 25,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w800),
//                           // overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       IconButton(
//                           onPressed: () {},
//                           icon: Icon(
//                             Icons.edit,
//                             color: Colors.white,
//                           )),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         '${widget.note} ',
//                         style: GoogleFonts.roboto(
//                             fontSize: 18,
//                             color: Colors.grey.shade300,
//                             letterSpacing: .25,
//                             fontWeight: FontWeight.w300),
//                         // overflow: TextOverflow.ellipsis,
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.symmetric(vertical: 30),
//                         width: MediaQuery.of(context).size.width * 0.75,
//                         height: MediaQuery.of(context).size.height * 0.07,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: HexColor('68fe9a')),
//                           onPressed: () async {},
//                           child: Text('Done',
//                               style: GoogleFonts.raleway(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w700,
//                               )),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.14,
//                         height: MediaQuery.of(context).size.height * 0.07,
//                         decoration: BoxDecoration(
//                             color: Colors.white.withOpacity(0.15),
//                             borderRadius: BorderRadius.circular(8)),
//                         child: Icon(
//                           FeatherIcons.trash,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   //   children: [
//                   //     Container(
//                   //       padding: EdgeInsets.all(10),
//                   //       decoration: BoxDecoration(
//                   //           color: Colors.white.withOpacity(0.15),
//                   //           borderRadius: BorderRadius.circular(8)),
//                   //       child: Icon(
//                   //         FeatherIcons.trash,
//                   //         color: Colors.white,
//                   //       ),
//                   //     ),
//                   //     Container(
//                   //       padding: EdgeInsets.all(10),
//                   //       decoration: BoxDecoration(
//                   //           color: Colors.white.withOpacity(0.15),
//                   //           borderRadius: BorderRadius.circular(8)),
//                   //       child: Icon(
//                   //         FeatherIcons.edit,
//                   //         color: Colors.white,
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

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

class EditNote extends StatefulWidget {
  String? title;
  String? note;
  EditNote({super.key, this.note, this.title});

  @override
  State<EditNote> createState() => _EditNoteState();
}

Auth auth = Auth();
Database database = Database();
int? selectedColor;
final _formKey = GlobalKey<FormState>();
TextEditingController titleController = TextEditingController();
TextEditingController noteController = TextEditingController();

class _EditNoteState extends State<EditNote> {
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
                  child: Text('Edit Note',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 45)),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        maxLines: 1,
                        controller: titleController,
                        validator: (val) => titleController.text.isEmpty
                            ? "Please Enter title"
                            : null,
                        onChanged: (value) {
                          setState(() {
                            value = titleController.text;
                          });
                        },
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                            hintText: 'title',
                            hintStyle: GoogleFonts.raleway(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            fillColor: Colors.grey.shade900.withOpacity(0.35),
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8))),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue: 'hhh',
                        maxLines: 6,
                        controller: noteController,
                        validator: (val) => noteController.text.isEmpty
                            ? "Please Enter note"
                            : null,
                        onChanged: (value) {
                          setState(() {
                            value = noteController.text;
                          });
                        },
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                            hintText: 'Note',
                            hintStyle: GoogleFonts.raleway(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            fillColor: Colors.grey.shade900.withOpacity(0.35),
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8))),
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
                                  ? '#87CEEB'
                                  : selectedColor == 1
                                      ? '#87CEEB'
                                      : selectedColor == 2
                                          ? '#00FF00'
                                          : selectedColor == 3
                                              ? '#FFA500'
                                              : selectedColor == 4
                                                  ? '#ffbf00'
                                                  : null);

                          Get.off(Home(
                            color: selectedColor == 0
                                ? Colors.red
                                : selectedColor == 1
                                    ? Colors.red
                                    : selectedColor == 2
                                        ? Colors.green
                                        : selectedColor == 3
                                            ? Colors.amber
                                            : selectedColor == 4
                                                ? Colors.orange
                                                : Container(),
                          ));
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
