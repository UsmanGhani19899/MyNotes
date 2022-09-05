import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:mynotes/Screens/editNote.dart';

class DetailNote extends StatefulWidget {
  String? title;
  String? note;
  String? date;
  String? id;
  DetailNote({super.key, this.id, this.date, this.note, this.title});

  @override
  State<DetailNote> createState() => _DetailNoteState();
}

class _DetailNoteState extends State<DetailNote> {
  DateTime? now;
  String? formattedDate;

  bool filterMode = false;
  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    formattedDate = DateFormat('yyyy-MM-dd').format(now!);
    // _tabController = TabController(length: 2, vsync: this);
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              margin: EdgeInsets.only(top: 25, bottom: 25),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(
                          FeatherIcons.arrowLeft,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(EditNote(
                              // noteController: widget.note.to,
                              // note: widget.note,
                              // title: widget.title,
                              ));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(
                            FeatherIcons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${widget.title} ',
                          style: GoogleFonts.roboto(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                          // overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          '${widget.date}',
                          style: GoogleFonts.roboto(
                              fontSize: 14, color: Colors.grey.shade500),
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    '${widget.note} ',
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: Colors.grey.shade300,
                        letterSpacing: .25,
                        fontWeight: FontWeight.w300),
                    // overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 30),
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: HexColor('68fe9a')),
                          onPressed: () async {
                            database.noteDone('${widget.id}');
                            Navigator.pop(context);
                          },
                          child: Text('Done',
                              style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          database.deleteNote('${widget.id}');
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.14,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(
                            FeatherIcons.trash,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Container(
                  //       padding: EdgeInsets.all(10),
                  //       decoration: BoxDecoration(
                  //           color: Colors.white.withOpacity(0.15),
                  //           borderRadius: BorderRadius.circular(8)),
                  //       child: Icon(
                  //         FeatherIcons.trash,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //     Container(
                  //       padding: EdgeInsets.all(10),
                  //       decoration: BoxDecoration(
                  //           color: Colors.white.withOpacity(0.15),
                  //           borderRadius: BorderRadius.circular(8)),
                  //       child: Icon(
                  //         FeatherIcons.edit,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
