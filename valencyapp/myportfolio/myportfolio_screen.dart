// Variables given to the portfolio screen when drawing to screen:
// 1. FIAT Balance Amount (for top right display)
// 2. Value graph points array (for each range)
// 3. Equity Amount
// 4. Available Amount
// 5. Currency
// Calculated on device 6. Percentage change for each range (calculated on device to save bandwidth)
// 7. The price per token for all assets in my wallet (used to calculate total value and percentage change)
// 8. Any Open Positions - Asset Name, Opening Rate, Opening Date, Current Rate, Expiry Date, Leverage (percentage change calculated on device)

import 'package:flutter/material.dart';
import 'package:valencyapp/components/main/bottombar/bottombar.dart';
import 'package:valencyapp/components/main/fundsdisplay.dart';
import 'package:valencyapp/components/main/equitydisplay.dart';
import 'package:valencyapp/components/main/valuegraph.dart';

class MyPortfolioScreen extends StatelessWidget {
  MyPortfolioScreen({
    super.key
  });

  // All backend datapoints go here (THESE SHOULD BE CONVERTED TO 2D ARRAYS TO ACCOUNT FOR GRAPH AND RANGES)
  final int amountOfFunds;            // General
  List<double> pricePerAsset = [];    // My Wallet
  List<String> assetName = [];        // Positions
  List<double> openingRate = [];        //
  List<double> currentRate = [];        //
  List<DateTime> openingDate = [];      //
  List<DateTime> expiryDate = [];       //
  List<int> leverage = [];              //
  
  // Equity/Available Amounts can be calculated from price per asset, amount of assets, and positions
  // 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: const[



              ValencyFundsDisplay(
                currency: 'AUD', 
                amountOfFunds: amountOfFunds
              ),

              ValencyEquityDisplay(
                topText: 'My Portfolio', 
                equity: equityAmount, 
                available: availableAmount, 
                switching: true, 
                isAvailableDisplaying: true
              ),

              // VALENCYGRAPH GOES HERE

              // VALENCY MY WALLET GOES HERE

              // VALENCY MY POSITIONS GOES HERE

              ValencyBottomBar(
                focusedIcon: 0,
              ),



            ],
          ),
        ),
      ),
    );
  }
}