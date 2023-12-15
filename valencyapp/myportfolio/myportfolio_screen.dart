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
import 'package:valencyapp/components/main/valuegraph/valuegraph.dart';

class MyPortfolioScreen extends StatelessWidget {
  MyPortfolioScreen({
    super.key
  });

  // Top of Screen
  final int amountOfFIATFunds;          // [Uses Bandwidth] The amount of FIAT funds in the Valency account
  double availableAmount;               // [Calculated Locally] The total available amount (calculated by getting all my portfolio assets most recent price per asset and multiplying it by the amount of each asset)
  double equityAmount;                  // [Calculated Locally] The total equity amount (calculated by getting all my portfolio assets most recent price per asset, multiplying it by the amount of each asset, and also adding on the current price for each position)
  List<double> dollarChange = [];       // [Calculated Locally] The total dollar change for each range (first 5 values are available, last 5 values are equity)(calculated by comparing price per asset from beginning index to beginning index per asset, and multiplying each asset value by the amount owned (gotten locally from wallet))
  List<double> percentageChange = [];   // [Calculated Locally] The total percentage change for each range (first 5 values are available, last 5 values are equity)(calculated by comparing price per asset from beginning index to beginning index per asset, and multiplying each asset value by the amount owned (gotten locally from wallet))

  // My Wallet: ~1/30th of a megabyte per asset request
  List<double> oneDayIntervals = [];       // [Uses Bandwidth] Each asset price every 2 minutes for 1 day (first 720 = first asset, second 720 = second asset)
  List<double> oneWeekIntervals = [];      // [Uses Bandwidth] Each asset price every 15 minutes for 1 week (first 672 = first asset, second 672 = second asset)
  List<double> oneMonthIntervals = [];     // [Uses Bandwidth] Each asset price every 30 minutes for 1 month (first 1440 = first asset, second 1440 = second asset)
  List<double> threeMonthIntervals = [];   // [Uses Bandwidth] Each asset price every 2 hours for 3 months (first 1080 = first asset, second 1080 = second asset)
  List<double> oneYearIntervals = [];      // [Uses Bandwidth] Each asset price every day for 1 year (first 365 = first asset, second 365 = second asset)
  List<double> maxIntervals = [];          // [Uses Bandwidth] Divide index by number of assets to get number of week intervals per asset
  final int numberOfAssets;                // [Calculated Locally] The number of assets in the wallet
  List<double> pricePerToken = [];         // [Calculated Locally] The price of each asset in the wallet (gotten from most recent in the one day interval for each asset)

  // My Positions: ~1.11th of a kilobyte per position request
  List<String> assetName = [];                // [Uses Bandwidth] The name of the assets being used in positions
  List<double> openingRatePerContract = [];   // [Uses Bandwidth] The opening rates of all positions (per contract)
  List<double> currentRatePerContract = [];   // [Uses Bandwidth] The current rates of all positions (per contract)
  List<int> numberOfContracts = [];           // [Uses Bandwidth] The number of contracts in all positions
  List<DateTime> openingDate = [];            // [Uses Bandwidth] The opening date of all positions
  List<DateTime> expiryDate = [];             // [Uses Bandwidth] The expiration date of all positions
  List<int> leverage = [];                    // [Uses Bandwidth] The leverage amount of all positions (1 = no leverage, 2 = 2x leverage, 3 = 3x leverage and so on)
  List<double> totalOpeningRate = [];         // [Calculated Locally] The total opening rate (openingRatePerContract * numberOfContracts)
  List<double> totalCurrentRate = [];         // [Calculated Locally] The total current rate (currentRatePerContract * numberOfContracts)

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