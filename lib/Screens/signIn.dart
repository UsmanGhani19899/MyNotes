import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mynotes/Screens/add.dart';

import '../Widgets/customeFields.dart';
import '../Widgets/passwordField.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _SignInState extends State<SignIn> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.07),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('SIGNIN',
                          style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 45)),
                      SizedBox(
                        height: 3,
                      ),
                      Text('WELCOME USER',
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
                      SizedBox(
                        height: 20,
                      ),
                      Text('Forgot Password?',
                          style: GoogleFonts.raleway(
                            color: Colors.grey.shade100.withOpacity(0.55),
                            fontWeight: FontWeight.w700,
                          )),
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        auth.Signin(context, emailController.text,
                            passwordController.text);
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
                    Text("Don't have account?",
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
