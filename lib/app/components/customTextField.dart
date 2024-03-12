import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController  controller;
  final String hinText;
  final String labelText;
  final bool obsureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;

  CustomTextField({
    super.key,
    required this.controller,
    required this.hinText,
    required this.labelText,
    required this.obsureText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    const Color primary = Color(0xFF525252);
    const Color primaryBlue = Color(0xFF5566FF);
    const Color labelColor = Color(0xFFC0C0C0);

      return TextFormField(
        obscureText: widget.obsureText,
        controller: widget.controller,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: GoogleFonts.plusJakartaSans(
            fontSize: 18,
            color: isFocused || widget.controller.text.isNotEmpty
                ? primaryBlue
                : labelColor,
            fontWeight: FontWeight.w600,
          ),
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
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
          contentPadding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
          hintText: widget.hinText,
          hintStyle: GoogleFonts.plusJakartaSans(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        validator: widget.validator,
        onTap: () {
          setState(() {
            isFocused = true;
          });
        },
        onChanged: (text) {
          setState(() {
            isFocused = text.isNotEmpty;
          });
        },
        onEditingComplete: () {
          setState(() {
            isFocused = false;
          });
        },
        onFieldSubmitted: (value) {
          setState(() {
            isFocused = false;
          });
        },
      );
  }
}
