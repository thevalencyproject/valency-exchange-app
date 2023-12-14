// 3 Options: My Wallet, My Positions, or My Portfolio
//           AND
//            Equity/Available Switching or No Equity/Available Switching
import 'package:flutter/material.dart';

class ValencyEquityDisplay extends StatelessWidget {
  final String topText;               // The text above the equity/available display (usually Title Text for the entire screen)
  final double equity;                // The equity amount 
  final double available;             // The available amount
  final bool switching;               // True if switching is available
  final bool isAvailableDisplaying;   // True when the available amount is displaying

  ValencyEquityDisplay({
    super.key,
    required this.topText,
    required this.equity,
    required this.available,
    required this.switching,
    required this.isAvailableDisplaying,
  });

  // I/O Controllers
  void switchType() {}          // Called when switch avaliable/equity button is pressed - redraws display with other type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: const[


              
              Text('${topText}', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 96
                ),
              ),

              switch(switching) {
              case 0:   // No Switching - use equity
                Text('${equity}', 
                  style: TextStyle(
                    color: Colors.black, 
                    fontSize: 96
                  ),
                ),

                break;
              case 1:   // Switching
                switch(isAvailableDisplaying) {
                case 0:   // Display Equity Amount + Switcher
                  Text('${equity}', 
                    style: TextStyle(
                      color: Colors.black, 
                      fontSize: 96
                    ),
                  ),
                  ValencyEquitySwitcher(
                    true,
                    switchType,
                  ),

                  break;
                case 1:   // Display Available Amount + Switcher
                  Text('${available}', 
                    style: TextStyle(
                      color: Colors.black, 
                      fontSize: 96
                    ),
                  ),
                  ValencyEquitySwitcher(
                    false,
                    switchType,
                  ),

                  break;
                }

                break;
              }



            ],
          ),
        ),
      ),
    );
  }
}

class ValencyEquitySwitcher extends StatelessWidget {
  final bool equity;           // True if displaying equity, false if displaying available
  final Function()? onSwitch;  // Detects button presses

  ValencyEquitySwitcher({
    super.key,
    required this.equity,
    required this.onSwitch,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSwitch,
      child: 
        switch(equity) {
        case 0:
          Text(
            'Equity', 
            style: TextStyle(
              color: Colors.black, 
              fontSize: 36
            ),
          ),
          break;
        case 1:
          Text(
            'Available', 
            style: TextStyle(
              color: Colors.black, 
              fontSize: 36
            ),
          ),
          break;
        }
    );
  }
}