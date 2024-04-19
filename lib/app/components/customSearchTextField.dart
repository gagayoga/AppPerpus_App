import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchTextField extends StatelessWidget {
  final TextEditingController  controller;
  final String hinText;
  final String labelText;
  final bool obsureText;
  final Widget? suffixIcon;
  final void Function(String) onChanged;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;

  const CustomSearchTextField({
    super.key,
    required this.controller,
    required this.hinText,
    required this.labelText,
    required this.onChanged,
    required this.obsureText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    const Color primary = Color(0xFF525252);
    const Color primaryBlue = Color(0xFF5566FF);
    const Color labelColor = Color(0xFFC0C0C0);

    return TextFormField(
      obscureText: obsureText,
      controller: controller,
      onChanged: onChanged,
      style: GoogleFonts.plusJakartaSans(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: GoogleFonts.plusJakartaSans(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: primaryBlue,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder:  OutlineInputBorder(
          borderSide: const BorderSide(color: primary, width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: const BorderSide(color: primaryBlue, width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
        hintText: hinText,
        hintStyle: GoogleFonts.plusJakartaSans(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    );
  }
}
