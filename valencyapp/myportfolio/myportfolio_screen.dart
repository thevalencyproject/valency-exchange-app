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
  }) : super(key: key);

  // Top of Screen
  ValueNotifier<double> amountOfFIATFunds;   // [Uses Bandwidth] The amount of FIAT funds in the Valency account
  ValueNotifier<double> availableAmount;     // [Calculated Locally] The total available amount (calculated by getting all my portfolio assets most recent price per asset and multiplying it by the amount of each asset)
  ValueNotifier<double> equityAmount;        // [Calculated Locally] The total equity amount (calculated by getting all my portfolio assets most recent price per asset, multiplying it by the amount of each asset, and also adding on the current price for each position)
  final List<double> dollarChange;           // [Calculated Locally] The total dollar change for each range (first 5 values are available, last 5 values are equity)(calculated by comparing price per asset from beginning index to beginning index per asset, and multiplying each asset value by the amount owned (gotten locally from wallet))
  final List<double> percentageChange;       // [Calculated Locally] The total percentage change for each range (first 5 values are available, last 5 values are equity)(calculated by comparing price per asset from beginning index to beginning index per asset, and multiplying each asset value by the amount owned (gotten locally from wallet))

  // My Wallet: ~1/30th of a megabyte per asset request
  final List<double> oneDayIntervals;       // [Uses Bandwidth] Each asset price every 2 minutes for 1 day (first 720 = first asset, second 720 = second asset)
  final List<double> oneWeekIntervals;      // [Uses Bandwidth] Each asset price every 15 minutes for 1 week (first 672 = first asset, second 672 = second asset)
  final List<double> oneMonthIntervals;     // [Uses Bandwidth] Each asset price every 30 minutes for 1 month (first 1440 = first asset, second 1440 = second asset)
  final List<double> threeMonthIntervals;   // [Uses Bandwidth] Each asset price every 2 hours for 3 months (first 1080 = first asset, second 1080 = second asset)
  final List<double> oneYearIntervals;      // [Uses Bandwidth] Each asset price every day for 1 year (first 365 = first asset, second 365 = second asset)
  final List<double> maxIntervals;          // [Uses Bandwidth] Divide index by number of assets to get number of week intervals per asset
  final int numberOfAssets;                 // [Calculated Locally] The number of assets in the wallet
  final List<double> pricePerToken;         // [Calculated Locally] The price of each asset in the wallet (gotten from most recent in the one day interval for each asset)

  // My Positions: ~1.11th of a kilobyte per position request
  final List<String> assetName;                // [Uses Bandwidth] The name of the assets being used in positions
  final List<double> openingRatePerContract;   // [Uses Bandwidth] The opening rates of all positions (per contract)
  final List<double> currentRatePerContract;   // [Uses Bandwidth] The current rates of all positions (per contract)
  final List<int> numberOfContracts;           // [Uses Bandwidth] The number of contracts in all positions
  final List<DateTime> openingDate;            // [Uses Bandwidth] The opening date of all positions
  final List<DateTime> expiryDate;             // [Uses Bandwidth] The expiration date of all positions
  final List<int> leverage;                    // [Uses Bandwidth] The leverage amount of all positions (1 = no leverage, 2 = 2x leverage, 3 = 3x leverage and so on)
  final List<double> totalOpeningRate;         // [Calculated Locally] The total opening rate (openingRatePerContract * numberOfContracts)
  final List<double> totalCurrentRate;         // [Calculated Locally] The total current rate (currentRatePerContract * numberOfContracts)

  @override
  _MyPortfolioScreenState createState() => _MyPortfolioScreenState();
}

class _MyPortfolioScreenState extends State<MyPortfolioScreen> {
  // Combined Classes
  final List<ValencyWalletAsset> assets = [];   // Need to fill list using input data
  final List<ValencyPosition> positions = [];   // Need to fill list using input data

  DisplayRange currentRange = DisplayRange.daily; // Initial range

  void _updateRange(DisplayRange newRange) {
    setState(() {
      currentRange = newRange;
    });
  }

  // I/O Controllers
  void editController(int index) {}     // Uses input and positions list to determine which position is being edited
  void closeController(int index) {}    // Uses input and positions list to determine which position is being closed

  // Called when the user changes the range using the range buttons tied with the value graph
  dynamic onRangeChange(DisplayRange newRange) {
    currentRange = newRange;    // Change Current Range to newRange
  }

  // Called to build the assets array (using input data)
  void _buildAssets() {

  }

  // Called to build the positions array (using input data)
  void _buildPositions() {

  }

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
                onRangeChange: onRangeChange,                         // Callback to notify parent
              ),

              ValencyWalletAssetDisplay(
                assets: assets,                               // The assets that will be displayed
                currentRange: currentRange,                   // The range that is displayed
                visibleCount: 4,                              // 4 positions are visible in the widget before having to scroll (height control)
                isSelectable: false,                          // The assets are not selectable
              ),

              ValencyPositionDisplay(
                positions: positions,               // The positions that will be displayed
                visibleCount: 3,                    // 3 positions are visible in the widget before having to scroll (height control)
                isSelectable: false,                // The positions are not selectable
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
// The variables passed through should be changed to pointers!!
class MyPortfolioScreen extends StatelessWidget {
  MyPortfolioScreen({
    super.key,
    required this.amountOfFIATFunds,
    required this.availableAmount,
    required this.equityAmount,
    required this.dollarChange,
    required this.percentageChange,
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
  });

  // Top of Screen
  ValueNotifier<double> amountOfFIATFunds;   // [Uses Bandwidth] The amount of FIAT funds in the Valency account
  ValueNotifier<double> availableAmount;     // [Calculated Locally] The total available amount (calculated by getting all my portfolio assets most recent price per asset and multiplying it by the amount of each asset)
  ValueNotifier<double> equityAmount;        // [Calculated Locally] The total equity amount (calculated by getting all my portfolio assets most recent price per asset, multiplying it by the amount of each asset, and also adding on the current price for each position)
  final List<double> dollarChange;           // [Calculated Locally] The total dollar change for each range (first 5 values are available, last 5 values are equity)(calculated by comparing price per asset from beginning index to beginning index per asset, and multiplying each asset value by the amount owned (gotten locally from wallet))
  final List<double> percentageChange;       // [Calculated Locally] The total percentage change for each range (first 5 values are available, last 5 values are equity)(calculated by comparing price per asset from beginning index to beginning index per asset, and multiplying each asset value by the amount owned (gotten locally from wallet))

  // My Wallet: ~1/30th of a megabyte per asset request
  final List<double> oneDayIntervals;       // [Uses Bandwidth] Each asset price every 2 minutes for 1 day (first 720 = first asset, second 720 = second asset)
  final List<double> oneWeekIntervals;      // [Uses Bandwidth] Each asset price every 15 minutes for 1 week (first 672 = first asset, second 672 = second asset)
  final List<double> oneMonthIntervals;     // [Uses Bandwidth] Each asset price every 30 minutes for 1 month (first 1440 = first asset, second 1440 = second asset)
  final List<double> threeMonthIntervals;   // [Uses Bandwidth] Each asset price every 2 hours for 3 months (first 1080 = first asset, second 1080 = second asset)
  final List<double> oneYearIntervals;      // [Uses Bandwidth] Each asset price every day for 1 year (first 365 = first asset, second 365 = second asset)
  final List<double> maxIntervals;          // [Uses Bandwidth] Divide index by number of assets to get number of week intervals per asset
  final int numberOfAssets;                 // [Calculated Locally] The number of assets in the wallet
  final List<double> pricePerToken;         // [Calculated Locally] The price of each asset in the wallet (gotten from most recent in the one day interval for each asset)

  // My Positions: ~1.11th of a kilobyte per position request
  final List<String> assetName;                // [Uses Bandwidth] The name of the assets being used in positions
  final List<double> openingRatePerContract;   // [Uses Bandwidth] The opening rates of all positions (per contract)
  final List<double> currentRatePerContract;   // [Uses Bandwidth] The current rates of all positions (per contract)
  final List<int> numberOfContracts;           // [Uses Bandwidth] The number of contracts in all positions
  final List<DateTime> openingDate;            // [Uses Bandwidth] The opening date of all positions
  final List<DateTime> expiryDate;             // [Uses Bandwidth] The expiration date of all positions
  final List<int> leverage;                    // [Uses Bandwidth] The leverage amount of all positions (1 = no leverage, 2 = 2x leverage, 3 = 3x leverage and so on)
  final List<double> totalOpeningRate;         // [Calculated Locally] The total opening rate (openingRatePerContract * numberOfContracts)
  final List<double> totalCurrentRate;         // [Calculated Locally] The total current rate (currentRatePerContract * numberOfContracts)

  // Combined Classes
  final List<ValencyWalletAsset> assets = [];   // Need to fill list using input data
  final List<ValencyPosition> positions = [];   // Need to fill list using input data

  // I/O Controllers
  void editController(int index) {}     // Uses input and positions list to determine which position is being edited
  void closeController(int index) {}    // Uses input and positions list to determine which position is being closed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [



              ValencyFundsDisplay(
                currency: 'AUD', 
                amountOfFunds: amountOfFIATFunds
              ),

              ValencyEquityDisplay(
                topText: 'My Portfolio', 
                equity: equityAmount, 
                available: availableAmount, 
                switching: true, 
              ),

              ValencyValueGraph(
                rangeButtons: 0,
                openingRate: 0,
                percentageChangeShowing: true,
                oneDayIntervals: oneDayIntervals,
                oneWeekIntervals: oneWeekIntervals,
                oneMonthIntervals: oneMonthIntervals,
                threeMonthIntervals: threeMonthIntervals,
                oneYearIntervals: oneYearIntervals,
                maxIntervals: maxIntervals,
              ),

              ValencyWalletAssetDisplay(
                assets: assets,                               // The assets that will be displayed
                currentRange: daily,                          // The range that is displayed
                visibleCount: 4,                              // How many assets are visible in the widget before having to scroll (height control)
                isSelectable: false,                          // If the assets are selectable or not (relayed to parent to update graphs, etc)
                final Function(DisplayRange) onRangeChange;   // Callback to notify parent
              ),

              ValencyPositionDisplay(
                positions: positions,
                visibleCount: 3,
                isSelectable: false,
                currentRange: daily,
                required this.onRangeChange,
                editController: editController,
                closeController: closeController,
              ),

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
*/