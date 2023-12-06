import 'package:flutter/material.dart'
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
    return GestureDetector(
      onTap: onTap,
      child: active?
      SvgPicture.asset(
        'components/images/mypositionsactive.svg',
        semanticsLabel: 'My Positions',
        height: 90,
        width: 90,
      ):
      SvgPicture.asset(
        'components/images/mypositions.svg',
        semanticsLabel: 'My Positions',
        height: 90,
        width: 90,
      ),
    );
  }
}