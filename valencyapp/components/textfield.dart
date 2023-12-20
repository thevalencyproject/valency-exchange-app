import 'package:flutter/material.dart';

class ValencyTextField extends StatelessWidget {
  final controller;         // The controller that can access the contents of the textfield
  final String hintText;    // The text that is displayed before the user types anything into the textfield
  final bool obscureText;   // Obscure the text that is inputted (for passwords - this is a boolean)
  final double? width;      // Optional width for the text field (in pixels)(can be null if want max width)

  const ValencyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        width: width ?? double.infinity,    // Set width to max possible allowed by parent container if NULL is supplied
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}