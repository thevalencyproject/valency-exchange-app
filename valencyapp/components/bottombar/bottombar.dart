import 'package:flutter/material.dart'

class ValencyBigButton extends StatelessWidget {
  final int focusedIcon;    // The button that is in focus: 0 = My Portfolio, 1 = Explore, 2 = My Wallet, 3 = My Positions, 4 = Settings

  const ValencyBigButton({
    super.key,
    required this.focusedIcon,
  });

  void MyPortfolioPressed() {

  }
  void ExplorePressed() {
    
  }
  void MyWalletPressed() {
    
  }
  void MyPositionsPressed() {
    
  }
  void SettingsPressed() {
    
  }

  @override
  Widget build(BuildContext context) {
    // Each button should be next to each other on the horizontal plane like in the designs
    ValencyMyPortfolioButton(
      onTap: MyPortfolioPressed,
      active: if(focusedIcon == 0) { true } else { false },
    ),
    ValencyExploreButton(
      onTap: ExplorePressed,
      active: if(focusedIcon == 1) { true } else { false },
    ),
    ValencyMyWalletButton(
      onTap: MyWalletPressed,
      active: if(focusedIcon == 2) { true } else { false },
    ),
    ValencyMyPositionsButton(
      onTap: MyPositionsPressed,
      active: if(focusedIcon == 3) { true } else { false },
    ),
    ValencySettingsButton(
      onTap: SettingsPressed,
      active: if(focusedIcon == 4) { true } else { false },
    ),
  }
}