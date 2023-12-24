/* A structure for each asset in the 'My Positions' section of the app
    -> Used as input for the ValencyPositionDisplay widget. */
class ValencyPosition {
  ValencyPosition({
    required this.icon,
    required this.name,
    required this.dailyChangePercentage,
    required this.weeklyChangePercentage,
    required this.monthlyChangePercentage,
    required this.threeMonthlyChangePercentage,
    required this.yearlyChangePercentage,
    required this.maxChangePercentage,
    required this.openingRate,
    required this.numOfContracts,
    required this.expiry,
    required this.leverage,
    required this.currentRate,
    required this.stoploss,
    required this.takeprofit,
  });

  final String icon;                            // A link to the icon (ensure this is local)
  final String name;                            // The asset name code (i.e. BTC, ETH, SOL, etc.)
  final double dailyChangePercentage;           // Change in position value over the past day (percentage)
  final double weeklyChangePercentage;          // Change in position value over the past week (percentage)
  final double monthlyChangePercentage;         // Change in position value over the past month (percentage)
  final double threeMonthlyChangePercentage;    // Change in position value over the past 3 months (percentage)
  final double yearlyChangePercentage;          // Change in position value over the past year (percentage)
  final double maxChangePercentage;             // Change in position value over the max interval (percentage)
  final double openingRate;                     // The opening rate of the position
  final double numOfContracts;                  // The number of contracts in the position
  final DateTime expiry;                        // When the position will expire
  final double leverage;                        // The amount of leverage the position uses

  final double currentRate;                                        // The current rate of the position
  late double entryCost = openingRate * numOfContracts;            // The entry cost of the position (opening rate * numOfContracts)
  late final double currentValue = currentRate * numOfContracts;   // The current value of the position (current rate * numOfContracts)
  late final double gain = currentValue * entryCost;               // Either the gain or loss of the position since opening (Current Value - Entry Cost)
  
  final double stoploss;     // The stop loss value (can be set by the user)
  final double takeprofit;   // The take profit value (can be set by the user)
}

/* A shrunken-down version of the ValencyPositions Structure for use in the 'My Portfolio' section of the app
    -> Used as input for the ValencyPositionDisplay widget (with it in portfolio[simple] mode). */
class ValencyPortfolioPosition {
  ValencyPortfolioPosition({
    required this.icon,
    required this.name,
    required this.dailyChangePercentage,
    required this.weeklyChangePercentage,
    required this.monthlyChangePercentage,
    required this.threeMonthlyChangePercentage,
    required this.yearlyChangePercentage,
    required this.maxChangePercentage,
    required this.openingRate,
    required this.numOfContracts,
    required this.expiry,
    required this.leverage,
  });

  final String icon;                            // A link to the icon (ensure this is local)
  final String name;                            // The asset name code (i.e. BTC, ETH, SOL, etc.)
  final double dailyChangePercentage;           // Change in position value over the past day (percentage)
  final double weeklyChangePercentage;          // Change in position value over the past week (percentage)
  final double monthlyChangePercentage;         // Change in position value over the past month (percentage)
  final double threeMonthlyChangePercentage;    // Change in position value over the past 3 months (percentage)
  final double yearlyChangePercentage;          // Change in position value over the past year (percentage)
  final double maxChangePercentage;             // Change in position value over the max interval (percentage)
  final double openingRate;                     // The opening rate of the position
  final double numOfContracts;                  // The number of contracts in the position
  final DateTime expiry;                        // When the position will expire
  final double leverage;                        // The amount of leverage the position uses
}