import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final String labelText;
  final bool obscureText;
  final IconData icon;
  final double Size;
  final TextEditingController controller;
  AuthTextField(
      {required this.Size,
      required this.icon,
      required this.keyboardType,
      required this.labelText,
      required this.obscureText,
      required this.controller

      });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.start,
      textInputAction: TextInputAction.none,
      obscureText: obscureText,
      autofocus: false,
      style: GoogleFonts.poppins(
          fontSize: Size,
          color: Color(0xff00205c),
          fontWeight: FontWeight.bold),
      keyboardType: keyboardType,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        fillColor: Color(0xffe7e7f2),
        filled: true,
        prefixIcon: Icon(
          icon,
          size: Size,
        ),
        prefixIconColor: Color(0xff00205c),
        label: Text(
          labelText,
          style: GoogleFonts.poppins(
              fontSize: Size, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
