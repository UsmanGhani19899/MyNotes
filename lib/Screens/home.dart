import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mynotes/Screens/add.dart';
import 'package:mynotes/Screens/detailNote.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  String? note;
  String? title;
  String? userName;
  String? email;
  final color;
  Home(
      {super.key,
      this.note,
      this.title,
      this.color,
      this.email,
      this.userName});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'My Notes',
            style: GoogleFonts.roboto(
                fontSize: 21, color: Colors.white, fontWeight: FontWeight.w500),
            // overflow: TextOverflow.ellipsis,
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(top: 10),
              // alignment: Alignment.topLeft,
              height: MediaQuery.of(context).size.height * 0.01,
              width: MediaQuery.of(context).size.width * 0.2,
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Users')
                      .where('uid',
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> user =
                                snapshot.data!.docs[index].data()
                                    as Map<String, dynamic>;
                            return Container(
                                margin: EdgeInsets.only(right: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            color:
                                                Colors.black.withOpacity(0.9),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${user['name']}',
                                                      style: GoogleFonts.roboto(
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      '${user['email']}',
                                                      style: GoogleFonts.roboto(
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.07,
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary: HexColor(
                                                                '68fe9a')),
                                                    onPressed: () async {
                                                      auth.logout();
                                                    },
                                                    child: Text('SignOut',
                                                        style:
                                                            GoogleFonts.raleway(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: CircleAvatar(
                                    child: Text(
                                      '${user['name'][0]}',
                                      style: GoogleFonts.roboto(
                                          color: Colors.white),
                                    ),
                                  ),
                                ));
                          });
                    } else {
                      return Container();
                    }
                  }),
            )
          ],
          toolbarHeight: 75,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Get.to(AddNote());
          },
          child: Icon(Icons.note_add_rounded, color: Colors.black),
        ),
        body: Container(
          // padding: EdgeInsets.only(top: 15),
          margin: EdgeInsets.symmetric(horizontal: 6),
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('MyNotes')
                  .where('isDone', isEqualTo: false)
                  .where('uid',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                } else if (snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FeatherIcons.fileText,
                          color: Colors.white,
                          size: 90,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'No Notes',
                          style: GoogleFonts.roboto(
                              fontSize: 21,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                }
                return GridView.builder(
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      Map<String, dynamic> myNotes = snapshot.data!.docs[index]
                          .data() as Map<String, dynamic>;
                      return GestureDetector(
                        onTap: () {
                          Get.to(DetailNote(
                            date: '${myNotes['dateTime']}',
                            note: '${myNotes['note']}',
                            title: '${myNotes['title']}',
                            id: snapshot.data!.docs[index].id,
                          ));
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                              color: HexColor('${myNotes['selectedColor']}')),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Text(
                                  '${myNotes['title']}'.toUpperCase(),
                                  style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                // color: Colors.white,
                                child: Text(
                                  '${myNotes['note']}',
                                  style: GoogleFonts.roboto(
                                      color: Colors.grey.shade900),
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ),
      ),
    );
  }
}
