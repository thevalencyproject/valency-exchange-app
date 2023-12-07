import 'package:flutter/material.dart';
import 'package:valencyapp/components/bottombar/myportfoliobutton.dart';
import 'package:valencyapp/components/bottombar/explorebutton.dart';
import 'package:valencyapp/components/bottombar/mywalletbutton.dart';
import 'package:valencyapp/components/bottombar/mypositionsbutton.dart';
import 'package:valencyapp/components/bottombar/settingsbutton.dart';

class ValencyBigButton extends StatelessWidget {
  final int focusedIcon;    // The button that is in focus: 0 = My Portfolio, 1 = Explore, 2 = My Wallet, 3 = My Positions, 4 = Settings

  const ValencyBigButton({
    super.key,
    required this.focusedIcon,
  });

  // I/O Controllers
  void MyPortfolioPressed() {}  // Switch to my portfolio (if not already there)
  void ExplorePressed() {}      // Switch to explore (if not already there)
  void MyWalletPressed() {}     // Switch to my wallet (if not already there)
  void MyPositionsPressed() {}  // Switch to my positions (if not already there)
  void SettingsPressed() {}     // Switch to settings (if not already there)

  @override
  Widget build(BuildContext context) {
    // Each button should be next to each other on the horizontal plane like in the designs
    
    ValencyMyPortfolioButton(
      onTap: MyPortfolioPressed,
      active: focusedIcon == 0?
        true:
        false,
    ),
    ValencyExploreButton(
      onTap: ExplorePressed,
      active: focusedIcon == 1?
        true:
        false,
    ),
    ValencyMyWalletButton(
      onTap: MyWalletPressed,
      active: focusedIcon == 2?
        true:
        false,
    ),
    ValencyMyPositionsButton(
      onTap: MyPositionsPressed,
      active: focusedIcon == 3?
        true:
        false,
    ),
    ValencySettingsButton(
      onTap: SettingsPressed,
      active: focusedIcon == 4?
        true:
        false,
    ),
  }
}