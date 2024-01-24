import 'package:flutter/material.dart';
import 'package:valencyapp/components/main/bottombar/bottombar.dart';
import 'package:valencyapp/components/main/fundsdisplay.dart';
import 'package:valencyapp/components/main/equitydisplay.dart';
import 'package:valencyapp/components/main/valuegraph/basegraph.dart';
import 'package:valencyapp/components/main/valuegraph/valuegraph.dart';
import 'package:valencyapp/components/main/walletassetdisplay.dart';
import 'package:valencyapp/components/main/positiondisplay.dart';
import 'package:valencyapp/structures/range.dart';
import 'package:valencyapp/structures/walletasset.dart';
import 'package:valencyapp/structures/position.dart';

class MyPortfolioScreen extends StatefulWidget {
  MyPortfolioScreen({
    Key? key,
    required this.amountOfFIATFunds,
    required this.availableAmount,
    required this.equityAmount,
    required this.dollarChange,
    required this.percentageChange,
    required this.name,
    required this.oneDayIntervals,
    required this.oneWeekIntervals,
    required this.oneMonthIntervals,
    required this.threeMonthIntervals,
    required this.oneYearIntervals,
    required this.maxIntervals,
    required this.numberOfAssets,
    required this.pricePerToken,
    required this.assetName,
    required this.openingRatePerContract,
    required this.currentRatePerContract,
    required this.numberOfContracts,
    required this.openingDate,
    required this.expiryDate,
    required this.leverage,
    required this.totalOpeningRate,
    required this.totalCurrentRate,
    required this.numberOfPositions,
  }) : super(key: key);

  // Top of Screen
  ValueNotifier<double> amountOfFIATFunds;   // [Uses Bandwidth] The amount of FIAT funds in the Valency account
  ValueNotifier<double> availableAmount;     // [Calculated Locally] The total available amount (calculated by getting all my portfolio assets most recent price per asset and multiplying it by the amount of each asset)
  ValueNotifier<double> equityAmount;        // [Calculated Locally] The total equity amount (calculated by getting all my portfolio assets most recent price per asset, multiplying it by the amount of each asset, and also adding on the current price for each position)
  final List<double> dollarChange;           // [Calculated Locally] The total dollar change for each range (first 5 values are available, last 5 values are equity)(calculated by comparing price per asset from beginning index to beginning index per asset, and multiplying each asset value by the amount owned (gotten locally from wallet))
  final List<double> percentageChange;       // [Calculated Locally] The total percentage change for each range (first 5 values are available, last 5 values are equity)(calculated by comparing price per asset from beginning index to beginning index per asset, and multiplying each asset value by the amount owned (gotten locally from wallet))

  // Global Inputs
  final List<double> oneDayIntervals;       // [Uses Bandwidth] Each asset+position price every 2 minutes for 1 day (first 720 = first asset, second 720 = second asset)
  final List<double> oneWeekIntervals;      // [Uses Bandwidth] Each asset+position price every 15 minutes for 1 week (first 672 = first asset, second 672 = second asset)
  final List<double> oneMonthIntervals;     // [Uses Bandwidth] Each asset+position price every 30 minutes for 1 month (first 1440 = first asset, second 1440 = second asset)
  final List<double> threeMonthIntervals;   // [Uses Bandwidth] Each asset+position price every 2 hours for 3 months (first 1080 = first asset, second 1080 = second asset)
  final List<double> oneYearIntervals;      // [Uses Bandwidth] Each asset+position price every day for 1 year (first 365 = first asset, second 365 = second asset)
  final List<double> maxIntervals;          // [Uses Bandwidth] Divide index by number of assets to get number of week intervals per asset

  // My Wallet: ~1/30th of a megabyte per asset request
  final List<String> name;                  // [Uses Bandwidth] The name of each asset
  final List<int> numberOfAssets;           // [Calculated Locally] The number of assets in each wallet
  final List<double> pricePerToken;         // [Calculated Locally] The price of each asset in the wallet (gotten from most recent in the one day interval for each asset)

  // My Positions: ~1.11th of a kilobyte per position request
  final List<String> assetName;                // [Uses Bandwidth] The name of the assets being used in positions
  final List<double> openingRatePerContract;   // [Uses Bandwidth] The opening rates of all positions (per contract)
  final List<double> currentRatePerContract;   // [Uses Bandwidth] The current rates of all positions (per contract)
  final List<int> numberOfContracts;           // [Uses Bandwidth] The number of contracts in all positions
  final List<DateTime> openingDate;            // [Uses Bandwidth] The opening date of all positions
  final List<DateTime> expiryDate;             // [Uses Bandwidth] The expiration date of all positions
  final List<double> leverage;                 // [Uses Bandwidth] The leverage amount of all positions (1 = no leverage, 2 = 2x leverage, 3 = 3x leverage and so on)
  final List<int> numberOfPositions;           // [Uses Bandwidth] The number of active positions
  final List<double> stopLoss;                 // [Uses Bandwidth] The point at which the positions automatically closes
  final List<double> takeProfit;               // [Uses Bandwidth] The point at which the positions automatically closes
  final List<double> totalOpeningRate;         // [Calculated Locally] The total opening rate (openingRatePerContract * numberOfContracts)
  final List<double> totalCurrentRate;         // [Calculated Locally] The total current rate (currentRatePerContract * numberOfContracts)

  @override
  _MyPortfolioScreenState createState() => _MyPortfolioScreenState();
}

class _MyPortfolioScreenState extends State<MyPortfolioScreen> {
  // Ranges
  DisplayRange currentRange = DisplayRange.daily;    // Initial range
  dynamic onRangeChange(DisplayRange newRange) {     // Called when the user changes the range using the range buttons tied with the value graph
    setState(() {
      currentRange = newRange;                       // Change Current Range to newRange (selected by user using the ValueGraph widget)
    });
  }
  
  // Asset Data + Rebuilding Function
  final List<ValencyWalletAsset> assets = [];   // Need to fill list using input data
  void _buildAssets() {     // Called to build the assets array (using input data)
    assets.clear();

    for(int i = 0; i < numberOfAssets; i++) {
      ValencyWalletAsset temp;

      temp.name = widget.name[i];
      temp.icon = "images/" + temp.name + "_icon.png";

      temp.dailyChangePercentage = (widget.oneDayIntervals[i * 720] - widget.oneDayIntervals[(i+1) * 720]) / widget.oneDayIntervals[(i+1) * 720];  // calculate from dailychangegraph
      temp.weeklyChangePercentage = (widget.oneWeekIntervals[i * 672] - widget.oneWeekIntervals[(i+1) * 672]) / widget.oneWeekIntervals[(i+1) * 672]; // calculate from weeklychangegraph
      temp.monthlyChangePercentage = (widget.oneMonthIntervals[i * 1440] - widget.oneMonthIntervals[(i+1) * 1440]) / widget.oneMonthIntervals[(i+1) * 1440];  // calculate from monthlychangegraph
      temp.threeMonthlyChangePercentage = (widget.threeMonthIntervals[i * 1080] - widget.threeMonthIntervals[(i+1) * 1080]) / widget.threeMonthIntervals[(i+1) * 1080]; // calculate from threemonthlychangegraph
      temp.yearlyChangePercentage = (widget.oneYearIntervals[i * 365] - widget.oneYearIntervals[(i+1) * 365]) / widget.oneYearIntervals[(i+1) * 365];   // calculate from yearlychangegraph
      temp.maxChangePercentage = (widget.maxIntervals[i * (widget.maxIntervals.length / widget.numberOfAssets[i])] - widget.maxIntervals[(i+1) * (widget.maxIntervals.length / widget.numberOfAssets[i])]) / widget.maxIntervals[(i+1) * (widget.maxIntervals.length / widget.numberOfAssets[i])];  // calculate from maxchangegraph

      temp.amountOwned = widget.numberOfAssets[i];
      temp.pricePerToken = widget.pricePerToken[i];

      assets.insert(temp);   // Insert the newly filled temporary struct to fill assets
    }
  }
  
  // Position Data + Rebuilding Function
  final List<ValencyPosition> positions = [];   // Need to fill list using input data
  void _buildPositions() {    // Called to build the positions array (using input data)
    positions.clear();

    for(int i = 0; i < numberOfPositions; i++) {
      ValencyPosition temp;

      temp.name = widget.assetName[i];
      temp.icon = "images/" + temp.name + "_icon.png";    // Form a link to the relevant icon using the name

      // Calculates Change Percentages from the price history over specific intervals given in the inputs
      temp.dailyChangePercentage = (widget.oneDayIntervals[(i + widget.numberOfAssets) * 720] - widget.oneDayIntervals[((i + widget.numberOfAssets)+1) * 720]) / widget.oneDayIntervals[((i + widget.numberOfAssets)+1) * 720];
      temp.weeklyChangePercentage = (widget.oneWeekIntervals[(i + widget.numberOfAssets) * 672] - widget.oneWeekIntervals[((i + widget.numberOfAssets)+1) * 672]) / widget.oneWeekIntervals[((i + widget.numberOfAssets)+1) * 672];
      temp.monthlyChangePercentage = (widget.oneMonthIntervals[(i + widget.numberOfAssets) * 1440] - widget.oneMonthIntervals[((i + widget.numberOfAssets)+1) * 1440]) / widget.oneMonthIntervals[((i + widget.numberOfAssets)+1) * 1440];
      temp.threeMonthlyChangePercentage = (widget.threeMonthIntervals[(i + widget.numberOfAssets) * 1080] - widget.threeMonthIntervals[((i + widget.numberOfAssets)+1) * 1080]) / widget.threeMonthIntervals[((i + widget.numberOfAssets)+1) * 1080];
      temp.yearlyChangePercentage = (widget.oneYearIntervals[(i + widget.numberOfAssets) * 365] - widget.oneYearIntervals[((i + widget.numberOfAssets)+1) * 365]) / widget.oneYearIntervals[((i + widget.numberOfAssets)+1) * 365];
      temp.maxChangePercentage = (widget.maxIntervals[i * (widget.maxIntervals.length / widget.numberOfPositions[i])] - widget.maxIntervals[(i+1) * (widget.maxIntervals.length / widget.numberOfPositions[i])]) / widget.maxIntervals[(i+1) * (widget.maxIntervals.length / widget.numberOfPositions[i])];

      temp.openingRate = widget.openingRatePerContract[i];   // The opening rate per contract
      temp.numOfContracts = widget.numberOfContracts[i];
      temp.expiry = widget.expiryDate[i];
      temp.leverage = widget.leverage[i];

      temp.currentRate = widget.currentRatePerContract[i];          // The current rate per contract
      temp.entryCost = temp.openingRate * temp.numOfContracts;      // Total entry cost
      temp.currentValue = temp.currentRate * temp.numOfContracts;   // Total current value
      temp.gain = temp.entryCost - temp.currentValue;               // The profit/loss of the position

      temp.stoploss = widget.stopLoss[i];
      temp.takeprofit  = widget.takeProfit[i];

      positions.insert(temp);  // Insert the newly filled temporary struct to fill assets
    }
  }

  // I/O Controllers
  void editController(int index) {}     // Uses input and positions list to determine which position is being edited
  void closeController(int index) {}    // Uses input and positions list to determine which position is being closed

  @override
  Widget build(BuildContext context) {
    _buildAssets;      // Build the assets array
    _buildPositions;   // Build the positions array

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [



              ValencyFundsDisplay(
                currency: 'AUD', 
                amountOfFunds: widget.amountOfFIATFunds,
              ),

              ValencyEquityDisplay(
                topText: 'My Portfolio', 
                equity: widget.equityAmount, 
                available: widget.availableAmount,
                switching: true,                      // Allow the user to switch between displaying equity or available amount
              ),

              ValencyValueGraph(
                rangeButtons: 0,                                      // Display the range buttons above the graph
                openingRate: 0,                                       // Don't display an opening rate (not showing positions on this screen)
                percentageChangeShowing: true,                        // Display the percentage changed over the selected range
                oneDayIntervals: widget.oneDayIntervals,              // Graph Data for Daily Intervals
                oneWeekIntervals: widget.oneWeekIntervals,            // Graph Data for Weekly Intervals
                oneMonthIntervals: widget.oneMonthIntervals,          // Graph Data for Monthly Intervals
                threeMonthIntervals: widget.threeMonthIntervals,      // Graph Data for 3 Monthly Intervals
                oneYearIntervals: widget.oneYearIntervals,            // Graph Data for Yearly Intervals
                maxIntervals: widget.maxIntervals,                    // Graph Data for Maximum Intervals
                currentRange: currentRange,                           // The range that is initially displayed
                onRangeChange: onRangeChange,                         // Callback to notify parent
              ),

              ValencyWalletAssetDisplay(
                assets: assets,                               // The assets that will be displayed
                currentRange: currentRange,                   // The range that is displayed
                visibleCount: 4,                              // 4 positions are visible in the widget before having to scroll (height control)
                isSelectable: true,                           // The assets are not selectable
              ),

              ValencyPositionDisplay(
                positions: positions,               // The positions that will be displayed
                visibleCount: 3,                    // 3 positions are visible in the widget before having to scroll (height control)
                isSelectable: true,                 // The positions are not selectable
                currentRange: currentRange,         // The range that is displayed (dynamically updates when MyPortfolioScreen updates value)
                editController: editController,     // Callback to notify parent (parses position index)
                closeController: closeController,   // Callback to notify parent (parses position index)
              ),

              ValencyBottomBar(
                focusedIcon: 0,    // My Portfolio Icon is focused
              ),



            ],
          ),
        ),
      ),
    );
  }
}

/*
// Top of Screen
  ValueNotifier<double> amountOfFIATFunds;   // [Uses Bandwidth] The amount of FIAT funds in the Valency account
  ValueNotifier<double> availableAmount;     // [Calculated Locally] The total available amount (calculated by getting all my portfolio assets most recent price per asset and multiplying it by the amount of each asset)
  ValueNotifier<double> equityAmount;        // [Calculated Locally] The total equity amount (calculated by getting all my portfolio assets most recent price per asset, multiplying it by the amount of each asset, and also adding on the current price for each position)
  final List<double> dollarChange;           // [Calculated Locally] The total dollar change for each range (first 5 values are available, last 5 values are equity)(calculated by comparing price per asset from beginning index to beginning index per asset, and multiplying each asset value by the amount owned (gotten locally from wallet))
  final List<double> percentageChange;       // [Calculated Locally] The total percentage change for each range (first 5 values are available, last 5 values are equity)(calculated by comparing price per asset from beginning index to beginning index per asset, and multiplying each asset value by the amount owned (gotten locally from wallet))

  // Global Inputs
  final List<double> oneDayIntervals;       // [Uses Bandwidth] Each asset+position price every 2 minutes for 1 day (first 720 = first asset, second 720 = second asset)
  final List<double> oneWeekIntervals;      // [Uses Bandwidth] Each asset+position price every 15 minutes for 1 week (first 672 = first asset, second 672 = second asset)
  final List<double> oneMonthIntervals;     // [Uses Bandwidth] Each asset+position price every 30 minutes for 1 month (first 1440 = first asset, second 1440 = second asset)
  final List<double> threeMonthIntervals;   // [Uses Bandwidth] Each asset+position price every 2 hours for 3 months (first 1080 = first asset, second 1080 = second asset)
  final List<double> oneYearIntervals;      // [Uses Bandwidth] Each asset+position price every day for 1 year (first 365 = first asset, second 365 = second asset)
  final List<double> maxIntervals;          // [Uses Bandwidth] Divide index by number of assets to get number of week intervals per asset

  // My Wallet: ~1/30th of a megabyte per asset request
  final List<String> name;                  // [Uses Bandwidth] The name of each asset
  final List<int> numberOfAssets;           // [Calculated Locally] The number of assets in each wallet
  final List<double> pricePerToken;         // [Calculated Locally] The price of each asset in the wallet (gotten from most recent in the one day interval for each asset)

  // My Positions: ~1.11th of a kilobyte per position request
  final List<String> assetName;                // [Uses Bandwidth] The name of the assets being used in positions
  final List<double> openingRatePerContract;   // [Uses Bandwidth] The opening rates of all positions (per contract)
  final List<double> currentRatePerContract;   // [Uses Bandwidth] The current rates of all positions (per contract)
  final List<int> numberOfContracts;           // [Uses Bandwidth] The number of contracts in all positions
  final List<DateTime> openingDate;            // [Uses Bandwidth] The opening date of all positions
  final List<DateTime> expiryDate;             // [Uses Bandwidth] The expiration date of all positions
  final List<double> leverage;                 // [Uses Bandwidth] The leverage amount of all positions (1 = no leverage, 2 = 2x leverage, 3 = 3x leverage and so on)
  final List<int> numberOfPositions;           // [Uses Bandwidth] The number of active positions
  final List<double> stopLoss;                 // [Uses Bandwidth] The point at which the positions automatically closes
  final List<double> takeProfit;               // [Uses Bandwidth] The point at which the positions automatically closes
  final List<double> totalOpeningRate;         // [Calculated Locally] The total opening rate (openingRatePerContract * numberOfContracts)
  final List<double> totalCurrentRate;         // [Calculated Locally] The total current rate (currentRatePerContract * numberOfContracts)
*/