import 'package:flutter/material.dart'

class ValencyBigButton extends StatelessWidget {
  final int focusedIcon;    // The button that is in focus: 0 = My Portfolio, 1 = Explore, 2 = My Wallet, 3 = My Positions, 4 = Settings

  const ValencyBigButton({
    super.key,
    required this.focusedIcon,
  });

  @override
  Widget build(BuildContext context) {
    // Each button should be next to each other on the horizontal plane like in the designs
    ValencyMyPortfolioButton(
      
    ),
    ValencyExploreButton(

    ),
    ValencyMyWalletButton(

    ),
    ValencyMyPositionsButton(

    ),
    ValencySettingsButton(

    ),
  }
}