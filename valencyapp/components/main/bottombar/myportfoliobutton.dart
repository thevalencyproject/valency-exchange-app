import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ValencyMyPortfolioButton extends StatelessWidget {
  final Function()? onTap;  // Detects button presses
  final bool active;        // If the button is active or not (if on my portfolio screen or not)

  const ValencyMyPortfolioButton({
    super.key,
    required this.onTap,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    String assetName = active ? 'components/images/myportfolioactive.svg' : 'components/images/myportfolio.svg';

    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        assetName,
        semanticsLabel: 'My Portfolio',
        height: 90,
        width: 90,
      ),
    );
  }
}