import 'package:flutter/material.dart';

class ValencyTextButton extends StatelessWidget {
  final Function()? onTap;    // Detects button presses
  final Color buttonColor;    // The colour of the button
  final String buttonText;    // The text displayed inside the button

  const ValencyTextButton({
    super.key,
    required this.onTap,
    required this.buttonColor,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              buttonText,
              style: TextStyle(color: buttonColor),
            ),
          ],
        ),
      ),
    );
  }
}