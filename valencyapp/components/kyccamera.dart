import 'package:flutter/material.dart'

class ValencyExitButton extends StatelessWidget {
  final int photoType;      // The type of photo. 0 = Front Licence, 1 = Back License, 2 = Face Photo

  const ValencyExitButton({
    super.key,
    required this.photoType,
  });

  bool onCameraSnap() {     // When a photo is taken
    // Get photo, send to KYC Validator using API, recieve good or bad - good = return true, bad = return false
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCameraSnap,
    );
  }
}