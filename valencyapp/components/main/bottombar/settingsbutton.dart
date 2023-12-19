import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ValencySettingsButton extends StatelessWidget {
  final Function()? onTap;  // Detects button presses
  final bool active;        // If the button is active or not (if on explore screen or not)

  const ValencySettingsButton({
    super.key,
    required this.onTap,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    String assetName = active ? 'components/images/settingsactive.svg' : 'components/images/settings.svg';

    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        assetName,
        semanticsLabel: 'Settings',
        height: 90,
        width: 90,
      ),
    );
  }
}