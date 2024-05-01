import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFieldProfile extends StatelessWidget {
  final TextEditingController  controller;
  final String hinText;
  final bool obsureText;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;

  CustomTextFieldProfile({
    super.key,
    required this.controller,
    required this.hinText,
    required this.obsureText,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    const Color primary = Colors.black;

    return TextFormField(
      obscureText: obsureText,
      controller: controller,
      style: GoogleFonts.plusJakartaSans(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF584141),
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: primary.withOpacity(0.90),
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: primary.withOpacity(0.90),
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: primary.withOpacity(0.90),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: primary.withOpacity(0.90),
          ),
        ),
        hintText: hinText,
        hintStyle: GoogleFonts.plusJakartaSans(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
      validator: validator,
    );
  }
}
