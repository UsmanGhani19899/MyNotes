import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> user =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  return Column(
                    children: [
                      CircleAvatar(
                        child: Text(
                          '${user['name']}',
                          style: GoogleFonts.roboto(color: Colors.white),
                        ),
                      ),
                      Text(
                        '${user['name']}',
                        style: GoogleFonts.roboto(color: Colors.white),
                      ),
                      Text(
                        '${user['email']}',
                        style: GoogleFonts.roboto(color: Colors.white),
                      ),
                    ],
                  );
                });
          }),
    );
  }
}
