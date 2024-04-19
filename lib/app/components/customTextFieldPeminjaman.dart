import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFieldPeminjaman extends StatelessWidget {
  final bool obsureText;
  final String? InitialValue;
  final String labelText;
  final Widget? preficIcon;
  final Widget? surficeIcon;

  const CustomTextFieldPeminjaman({
    super.key,
    required this.obsureText,
    required this.InitialValue,
    required this.labelText,
    this.preficIcon,
    this.surficeIcon,
  });

  @override
  Widget build(BuildContext context) {
    const Color backgroundInput = Color(0xFFF8F8F8);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            labelText,
            style: GoogleFonts.plusJakartaSans(
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),

          const SizedBox(
            height: 10,
          ),

          TextFormField(
            enabled: false,
            initialValue: InitialValue,
            obscureText: obsureText,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.black.withOpacity(0.50),
            ),
            decoration: InputDecoration(
              prefixIcon: preficIcon,
                fillColor: backgroundInput,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(20.20)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(20.20)),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(20.20)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(20.20)),
                hintText: 'Masukan Email',
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                hintStyle: GoogleFonts.plusJakartaSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black.withOpacity(0.50),
                )),
          ),
        ],
      ),
    );
  }
}
