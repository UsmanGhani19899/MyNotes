import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomeField extends StatefulWidget {
  TextEditingController? controller;
  int? maxlines;
  final String? fieldName;
  CustomeField({Key? key, this.controller, this.fieldName, this.maxlines})
      : super(key: key);

  @override
  State<CustomeField> createState() => _CustomeFieldState();
}

class _CustomeFieldState extends State<CustomeField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxlines,
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
      decoration: InputDecoration(
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
