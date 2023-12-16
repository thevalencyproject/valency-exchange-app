import 'package:flutter/material.dart';
import 'package:valencyapp/components/main/bottombar/bottombar.dart';
import 'package:valencyapp/components/main/fundsdisplay.dart';
import 'package:valencyapp/components/main/equitydisplay.dart';
import 'package:valencyapp/components/main/valuegraph/valuegraph.dart';

// The variables passed through should be changed to pointers!!
class MyWalletScreen extends StatelessWidget {
  MyWalletScreen({
    super.key,
    required this.amountOfFIATFunds,
    required this.availableAmount,
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
    required this.privateKeys,
    required this.publicKeys,
  });

  // Top of Screen
  final int amountOfFIATFunds;                // [Uses Bandwidth] The amount of FIAT funds in the Valency account
  final double availableAmount;               // [Calculated Locally] The total available amount (calculated by getting all my portfolio assets most recent price per asset and multiplying it by the amount of each asset)
  final List<double> dollarChange = [];       // [Calculated Locally] The total dollar change for each range (calculated by comparing price per asset from beginning index to beginning index per asset, and multiplying each asset value by the amount owned (gotten locally from wallet))
  final List<double> percentageChange = [];   // [Calculated Locally] The total percentage change for each range (calculated by comparing price per asset from beginning index to beginning index per asset, and multiplying each asset value by the amount owned (gotten locally from wallet))

  // My Wallet: ~1/30th of a megabyte per asset request
  final List<double> oneDayIntervals = [];       // [Uses Bandwidth] Each asset price every 2 minutes for 1 day (first 720 = first asset, second 720 = second asset)
  final List<double> oneWeekIntervals = [];      // [Uses Bandwidth] Each asset price every 15 minutes for 1 week (first 672 = first asset, second 672 = second asset)
  final List<double> oneMonthIntervals = [];     // [Uses Bandwidth] Each asset price every 30 minutes for 1 month (first 1440 = first asset, second 1440 = second asset)
  final List<double> threeMonthIntervals = [];   // [Uses Bandwidth] Each asset price every 2 hours for 3 months (first 1080 = first asset, second 1080 = second asset)
  final List<double> oneYearIntervals = [];      // [Uses Bandwidth] Each asset price every day for 1 year (first 365 = first asset, second 365 = second asset)
  final List<double> maxIntervals = [];          // [Uses Bandwidth] Divide index by number of assets to get number of week intervals per asset
  final int numberOfAssets;                      // [Calculated Locally] The number of assets in the wallet
  final List<double> pricePerToken = [];         // [Calculated Locally] The price of each asset in the wallet (gotten from most recent in the one day interval for each asset)
  final List<String> privateKeys = [];           // [Calculated Locally] Each wallets private key (a cipher that is decrypted with user input of password)
  final List<String> publicKeys = [];            // [Calculated Locally] Each wallets public key

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
                amountOfFunds: amountOfFIATFunds
              ),

              ValencyEquityDisplay(
                topText: 'My Wallet', 
                equity: null, 
                available: availableAmount, 
                switching: false, 
                isAvailableDisplaying: true
              ),

              // VALENCY MY WALLET GOES HERE

              // VALENCYGRAPH GOES HERE

              // VALENCY MY WALLET CONTROLS GOES HERE

              ValencyBottomBar(
                focusedIcon: 2,
              ),



            ],
          ),
        ),
      ),
    );
  }
}