import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ValencyExploreButton extends StatelessWidget {
  final Function()? onTap;  // Detects button presses
  final bool active;        // If the button is active or not (if on explore screen or not)

  const ValencyExploreButton({
    super.key,
    required this.onTap,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    String assetName = active ? 'components/images/exploreactive.svg' : 'components/images/explore.svg';

    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        assetName,
        semanticsLabel: 'Explore',
        height: 90,
        width: 90,
      ),
    );
  }
}