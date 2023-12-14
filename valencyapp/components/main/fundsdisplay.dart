// Displays the amount of funds (top right FIAT amount)
// Still need to add rectangle around text
import 'package:flutter/material.dart';

class ValencyFundsDisplay extends StatelessWidget {
  final double amountOfFunds;   // The amount 
  final String currency;        // The currency (US, EUR, GBP, AUD)

  ValencyFundsDisplay({
    super.key,
    required this.currency,
    required this.amountOfFunds,
  });

  // I/O Controllers
  void addFunds() {}            // Called when funds display is pressed (this should display the addFunds screen)

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: addFunds,
      child: Text(
        '${currency} ${amountOfFunds}', 
        style: TextStyle(
          color: Colors.black, 
          fontSize: 36
        ),
      ),
    );
  }
}