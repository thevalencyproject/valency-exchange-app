import 'package:flutter/material.dart'
import 'package:flutter_svg/flutter_svg.dart';

class ValencyExitButton extends StatelessWidget {
  final Function()? onTap;  // Detects button presses

  const ValencyExitButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        'components/images/exit.svg',
        semanticsLabel: 'Exit Button',
        height: 100,
        width: 100,
      ),
    );
  }
}