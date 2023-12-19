import 'package:flutter/material.dart';
import 'package:valencyapp/components/main/bottombar/myportfoliobutton.dart';
import 'package:valencyapp/components/main/bottombar/explorebutton.dart';
import 'package:valencyapp/components/main/bottombar/mywalletbutton.dart';
import 'package:valencyapp/components/main/bottombar/mypositionsbutton.dart';
import 'package:valencyapp/components/main/bottombar/settingsbutton.dart';

class ValencyBottomBar extends StatefulWidget {
  const ValencyBottomBar({
    super.key
  });

  @override
  State<ValencyBottomBar> createState() => _ValencyBottomBarState();
}

class _ValencyBottomBarState extends State<ValencyBottomBar> {
  int focusedIcon = 0;    // The button that is in focus: 0 = My Portfolio, 1 = Explore, 2 = My Wallet, 3 = My Positions, 4 = Settings

  void _handleIconPress(int index) {
    setState(() {
      focusedIcon = index;
    });

    switch(index) {
    case 0:   // Go to My Portfolio Screen
      break;
    case 1:   // Go to Explore Screen
      break;
    case 2:   // Go to My Wallet Screen
      break;
    case 3:   // Go to My Positions Screen
      break;
    case 4:   // Go to Settings Screen
      break;
    default:
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ValencyMyPortfolioButton(
            onTap: () => _handleIconPress(0),
            active: focusedIcon == 0,
          ),
          ValencyExploreButton(
            onTap: () => _handleIconPress(1),
            active: focusedIcon == 1,
          ),
          ValencyMyWalletButton(
            onTap: () => _handleIconPress(2),
            active: focusedIcon == 2,
          ),
          ValencyMyPositionsButton(
            onTap: () => _handleIconPress(3),
            active: focusedIcon == 3,
          ),
          ValencySettingsButton(
            onTap: () => _handleIconPress(4),
            active: focusedIcon == 4,
          ),
        ],
      ),
    );
  }
}