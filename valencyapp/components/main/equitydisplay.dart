// 3 Options: My Wallet, My Positions, or My Portfolio
//           AND
//            Equity/Available Switching or No Equity/Available Switching
import 'package:flutter/material.dart';

class ValencyEquityDisplay extends StatefulWidget {
  ValencyEquityDisplay({
    super.key,
    required this.topText,
    required this.equity,
    required this.available,
    required this.switching,
  });

  final String topText;               // The text above the equity/available display (usually Title Text for the entire screen)
  final double equity;                // The equity amount 
  final double available;             // The available amount
  final bool switching;               // True if switching is available

  @override
  State<ValencyEquityDisplay> createState() => _ValencyEquityDisplayState();
}

class _ValencyEquityDisplayState extends State<ValencyEquityDisplay> {
  bool isAvailableDisplaying = false;   // Equity gets displayed by default

  void switchType() {
    setState(() {
      isAvailableDisplaying = !isAvailableDisplaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.topText,
                style: const TextStyle(color: Colors.black, fontSize: 96),
              ),

              const SizedBox(height: 20),
              if(!widget.switching)
                Column(
                  children: [
                    Text(
                      isAvailableDisplaying ? '${widget.available}' : '${widget.equity}',
                      style: const TextStyle(color: Colors.black, fontSize: 96),
                    ),
                    ValencyEquitySwitcher(
                      isEquity: !isAvailableDisplaying,
                      onSwitch: switchType,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class ValencyEquitySwitcher extends StatelessWidget {
  ValencyEquitySwitcher({
    super.key,
    required this.isEquity,
    required this.onSwitch,
  });

  final bool isEquity;            // True if equity is being displayed
  final VoidCallback? onSwitch;   // Detects button presses

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSwitch,
      child: Text(
        isEquity ? 'Equity' : 'Available',
        style: const TextStyle(color: Colors.black, fontSize: 32),
      ),
    );
  }
}