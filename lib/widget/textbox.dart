import 'package:flutter/material.dart';

class CustomTextBox extends StatefulWidget {
  const CustomTextBox({super.key, required this.text, required this.icon});

  final String text;
  final Widget icon;

  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;
    final wt = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: 50,
      width: double.infinity,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: widget.text,
          hintStyle: const TextStyle(color: Colors.white),
          contentPadding: const EdgeInsets.symmetric(vertical: 13),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10), // Icon alignment fix
            child: widget.icon,
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
