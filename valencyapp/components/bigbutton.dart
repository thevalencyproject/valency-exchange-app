import 'package:flutter/material.dart'

class ValencyBigButton extends StatelessWidget {
  final Function()? onTap;  // Detects button presses
  final Color buttonColor;  // The colour of the button
  final String hintText;    // The text displayed inside the button

  const ValencyBigButton({
    super.key,
    required this.onTap,
    required this.buttonColor,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            hintText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}