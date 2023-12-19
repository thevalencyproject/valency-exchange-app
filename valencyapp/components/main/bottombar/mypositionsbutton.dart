import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ValencyMyPositionsButton extends StatelessWidget {
  final Function()? onTap;  // Detects button presses
  final bool active;        // If the button is active or not (if on explore screen or not)

  const ValencyMyPositionsButton({
    super.key,
    required this.onTap,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    String assetName = active ? 'components/images/mypositionsactive.svg' : 'components/images/mypositions.svg';

    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        assetName,
        semanticsLabel: 'My Positions',
        height: 90,
        width: 90,
      ),
    );
  }
}