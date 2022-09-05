import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Core/auth.dart';
import '../Widgets/customeFields.dart';
import '../Widgets/passwordField.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

Auth auth = Auth();

TextEditingController nameController = TextEditingController();

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.only(
        //             bottomLeft: Radius.circular(10),
        //             bottomRight: Radius.circular(10))),
        //     backgroundColor: Colors.grey.shade900.withOpacity(0.35),
        //     toolbarHeight: 80,
        //     title: ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.07),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('SIGNUP',
                          style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 45)),
                      SizedBox(
                        height: 3,
                      ),
                      Text('CREATE AN ACCOUNT',
                          style: GoogleFonts.raleway(
                              color: Colors.grey.shade300,
                              fontWeight: FontWeight.w300,
                              fontSize: 15))
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomeField(
                        fieldName: 'Name',
                        controller: nameController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomeField(
                        fieldName: 'Email',
                        controller: emailController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      PasswordCustomeField(
                        controller: passwordController,
                        fieldName: 'Password',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(primary: HexColor('68fe9a')),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        auth.SignUp(context, emailController.text,
                            passwordController.text, nameController.text);
                      } else {}
                    },
                    child: Text('SignIn',
                        style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have account?',
                        style: GoogleFonts.raleway(
                          color: Colors.grey.shade100.withOpacity(0.55),
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Text('SignUp',
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
