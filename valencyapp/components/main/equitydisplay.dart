import 'package:flutter/material.dart';

class ValencyEquityDisplay extends StatelessWidget {
  ValencyEquityDisplay({
    super.key,
    required this.topText,
    required this.equity,
    required this.available,
    required this.switching,
  });

  final String topText;                     // The text above the equity/available display (usually Title Text for the entire screen)
  final ValueNotifier<double> equity;       // The equity amount (ValueNotifier allows it to be dynamically updated)
  final ValueNotifier<double> available;    // The available amount (ValueNotifier allows it to be dynamically updated)
  final bool switching;                     // True if switching is available

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
                topText,
                style: const TextStyle(color: Colors.black, fontSize: 96),
              ),
              const SizedBox(height: 20),
              if (!switching)
                ValueListenableBuilder<double>(
                  valueListenable: equity,
                  builder: (_, value, __) => Text(
                    '$value',
                    style: const TextStyle(color: Colors.black, fontSize: 96),
                  ),
                ),
              if (switching)
                ValencyEquitySwitcher(
                  equity: equity,
                  available: available,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Switches between displaying equity and available amounts
class ValencyEquitySwitcher extends StatefulWidget {
  ValencyEquitySwitcher({
    super.key,
    required this.equity,
    required this.available,
  });

  final ValueNotifier<double> equity;
  final ValueNotifier<double> available;

  @override
  State<ValencyEquitySwitcher> createState() => _ValencyEquitySwitcherState();
}

// Logic for equity/available switching and displaying
class _ValencyEquitySwitcherState extends State<ValencyEquitySwitcher> {
  bool isEquityDisplaying = true;   // Equity displays by default

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ValueListenableBuilder<double>(
          valueListenable: isEquityDisplaying ? widget.equity : widget.available,
          builder: (_, value, __) => Text(
            '$value',
            style: const TextStyle(color: Colors.black, fontSize: 96),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => setState(() {
            isEquityDisplaying = !isEquityDisplaying;
          }),
          child: Text(
            isEquityDisplaying ? 'Equity' : 'Available',
            style: const TextStyle(color: Colors.black, fontSize: 32),
          ),
        ),
      ],
    );
  }
}