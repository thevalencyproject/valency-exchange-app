
import 'package:flutter/material.dart';

// Displays the amount of funds (top right FIAT amount)
class ValencyFundsDisplay extends StatelessWidget {
  ValencyFundsDisplay({
    super.key,
    required this.currency,
    required this.amountOfFunds,
  });

  final ValueNotifier<double> amountOfFunds;   // The amount (ValueNotifier allows it to dynamically update)
  final String currency;                       // The currency (US, EUR, GBP, AUD)

  // I/O Controllers
  void addFunds() {}    // Called when funds display is pressed (this should display the addFunds screen)

  @override
   Widget build(BuildContext context) {
    return GestureDetector(
      onTap: addFunds,
      child: ValueListenableBuilder<double>(
        valueListenable: amountOfFunds,     // Dynamic Updating
        builder: (context, amountOfFunds, child) {
          return FittedBox(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(    // Box around text
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Text(                  // Text Amount
                '${currency} $amountOfFunds',
                style: TextStyle(color: Colors.black, fontSize: 36),
              ),
            ),
          );
        },
      ),
    );
  }
}