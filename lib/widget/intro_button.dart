import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.onClick,
      this.color,
      this.fontColor});

  final String text;
  final Color? color;
  final Color? fontColor;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8 ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.aBeeZee(fontSize: ht * 0.03, color: fontColor),
          ),
        ),
      ),
    );
  }
}
