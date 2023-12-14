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
    return GestureDetector(
      onTap: onTap,
      child: active?
      SvgPicture.asset(
        'components/images/myportfolioactive.svg',
        semanticsLabel: 'My Portfolio',
        height: 90,
        width: 90,
      ):
      SvgPicture.asset(
        'components/images/myportfolio.svg',
        semanticsLabel: 'My Portfolio',
        height: 90,
        width: 90,
      ),
    );
  }
}