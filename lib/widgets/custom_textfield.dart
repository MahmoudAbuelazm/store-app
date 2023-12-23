import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.hint,
    this.onChanged,
    required this.inputType,
  }) : super(key: key);
  final String hint;
  Function(String)? onChanged;
  TextInputType inputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hint,
        hintStyle: GoogleFonts.poppins(
            color: Color(0xff191E21).withOpacity(.7),
            fontSize: 16,
            fontWeight: FontWeight.w500),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
