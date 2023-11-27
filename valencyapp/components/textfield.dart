import 'package:flutter/material.dart'

class ValencyTextField extends StatelessWidget {
  final controller;         // The controller that can access the contents of the textfield
  final String hintText;    // The text that is displayed before the user types anything into the textfield
  final bool obscureText;   // Obscure the text that is inputted (for passwords - this is a boolean)

  const ValencyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
    );
  }
}