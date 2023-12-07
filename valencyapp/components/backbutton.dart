import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ValencyBackButton extends StatelessWidget {
  final Function()? onTap;  // Detects button presses

  const ValencyBackButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        'components/images/back-arrow.svg',
        semanticsLabel: 'Back Button',
        height: 100,
        width: 100,
      ),
    );
  }
}