import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordCustomeField extends StatefulWidget {
  TextEditingController? controller;

  final String? fieldName;
  PasswordCustomeField({Key? key, this.controller, this.fieldName})
      : super(key: key);

  @override
  State<PasswordCustomeField> createState() => _PasswordCustomeFieldState();
}

bool passwordShow = true;

class _PasswordCustomeFieldState extends State<PasswordCustomeField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (val) => widget.controller!.text.isEmpty
          ? "Please Enter ${widget.fieldName}"
          : null,
      onChanged: (value) {
        setState(() {
          value = widget.controller!.text;
        });
      },
      style: GoogleFonts.raleway(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      obscureText: passwordShow,
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                passwordShow = !passwordShow;
              });
            },
            child: Icon(
              passwordShow == true ? Icons.visibility : Icons.visibility_off,
              color: Colors.white,
            ),
          ),
          hintText: '${widget.fieldName}',
          hintStyle: GoogleFonts.raleway(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          fillColor: Colors.grey.shade900.withOpacity(0.35),
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8))),
    );
  }
}
