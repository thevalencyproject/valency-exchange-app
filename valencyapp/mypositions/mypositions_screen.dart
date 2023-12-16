import 'package:flutter/material.dart';
import 'package:valencyapp/components/main/bottombar/bottombar.dart';
import 'package:valencyapp/components/main/equitydisplay.dart';
import 'package:valencyapp/components/main/valuegraph/valuegraph.dart';

// The variables passed through should be changed to pointers!!
class MyPositionsScreen extends StatelessWidget {
  MyPositionsScreen({
    super.key,
    required this.equityAmount,
    required this.dollarChange,
    required this.percentageChange,
    required this.assetName,
    required this.openingRatePerContract,
    required this.currentRatePerContract,
    required this.numberOfContracts,
    required this.openingDate,
    required this.expiryDate,
    required this.leverage,
    required this.totalOpeningRate,
    required this.totalCurrentRate,
    required this.stopLoss,
    required this.takeProfit,
    required this.closedAssetName,
    required this.closedOpeningRatePerContract,
    required this.closedClosingRatePerContract,
    required this.closedNumberOfContracts,
    required this.closedOpeningDate,
    required this.closedDate,
    required this.closedLeverage,
    required this.closedTotalOpeningRate,
    required this.closedTotalClosingRate,
  });

  // Top of Screen
  final double equityAmount;                  // [Calculated Locally] The total equity amount (calculated by getting all my portfolio assets most recent price per asset, multiplying it by the amount of each asset, and also adding on the current price for each position)
  final List<double> dollarChange = [];       // [Calculated Locally] The total dollar change for each range (first 5 values are available, last 5 values are equity)(calculated by comparing price per asset from beginning index to beginning index per asset, and multiplying each asset value by the amount owned (gotten locally from wallet))
  final List<double> percentageChange = [];   // [Calculated Locally] The total percentage change for each range (first 5 values are available, last 5 values are equity)(calculated by comparing price per asset from beginning index to beginning index per asset, and multiplying each asset value by the amount owned (gotten locally from wallet))

  // Open Positions: ~1/11th of a kilobyte per position request
  final List<String> assetName = [];                // [Uses Bandwidth] The name of the assets being used in positions
  final List<double> openingRatePerContract = [];   // [Uses Bandwidth] The opening rates of all positions (per contract)
  final List<double> currentRatePerContract = [];   // [Uses Bandwidth] The current rates of all positions (per contract)
  final List<int> numberOfContracts = [];           // [Uses Bandwidth] The number of contracts in all positions
  final List<DateTime> openingDate = [];            // [Uses Bandwidth] The opening date of all positions
  final List<DateTime> expiryDate = [];             // [Uses Bandwidth] The expiration date of all positions
  final List<int> leverage = [];                    // [Uses Bandwidth] The leverage amount of all positions (1 = no leverage, 2 = 2x leverage, 3 = 3x leverage and so on)
  final List<double> totalOpeningRate = [];         // [Calculated Locally] The total opening rate (openingRatePerContract * numberOfContracts)
  final List<double> totalCurrentRate = [];         // [Calculated Locally] The total current rate (currentRatePerContract * numberOfContracts)
  final List<double> stopLoss = [];                 // [Uses Bandwidth] If there is a stoploss for the position, it will be a non-zero number, if there isn't, it will be 0
  final List<double> takeProfit = [];               // [Uses Bandwidth] If there is a take profit for the position, it will be a non-zero number, if there isn't, it will be 0

  // Closed Positions (only uses bandwidth if logging on from a new device (or if non-cached), otherwise this data can be cached): 
  final List<String> closedAssetName = [];                // [Uses Bandwidth] The name of the assets being used in positions
  final List<double> closedOpeningRatePerContract = [];   // [Uses Bandwidth] The opening rates of all positions (per contract)
  final List<double> closedClosingRatePerContract = [];   // [Uses Bandwidth] The current rates of all positions (per contract)
  final List<int> closedNumberOfContracts = [];           // [Uses Bandwidth] The number of contracts in all positions
  final List<DateTime> closedOpeningDate = [];            // [Uses Bandwidth] The opening date of all positions
  final List<DateTime> closedDate = [];                   // [Uses Bandwidth] The expiration date of all positions
  final List<int> closedLeverage = [];                    // [Uses Bandwidth] The leverage amount of all positions (1 = no leverage, 2 = 2x leverage, 3 = 3x leverage and so on)
  final List<double> closedTotalOpeningRate = [];         // [Calculated Locally] The total opening rate (openingRatePerContract * numberOfContracts)
  final List<double> closedTotalClosingRate = [];         // [Calculated Locally] The total current rate (currentRatePerContract * numberOfContracts)
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: const[



              // VIEW CLOSED POSITIONS BUTTON GOES HERE

              ValencyEquityDisplay(
                topText: 'My Positions', 
                equity: equityAmount, 
                available: null, 
                switching: false, 
                isAvailableDisplaying: false,
              ),

              // MY POSITIONS GOES HERE

              // VALENCYGRAPH GOES HERE

              // MY POSITIONS DETAILS GOES HERE (includes edit and close buttons)

              ValencyBottomBar(
                focusedIcon: 3,
              ),



            ],
          ),
        ),
      ),
    );
  }
}