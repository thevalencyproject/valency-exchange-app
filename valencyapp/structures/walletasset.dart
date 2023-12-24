/* A structure for each asset in the 'My Portfolio' and 'My Wallet' sections of the app
    -> Used as input for the ValencyWalletAssetDisplay widget. */
class ValencyWalletAsset {
  ValencyWalletAsset({
    required this.icon,
    required this.name,
    required this.dailyChangePercentage,
    required this.weeklyChangePercentage,
    required this.monthlyChangePercentage,
    required this.threeMonthlyChangePercentage,
    required this.yearlyChangePercentage,
    required this.maxChangePercentage,
    required this.amountOwned,
    required this.pricePerToken,
  });

  final String icon;                                      // A link to the icon (ensure this is local)
  final String name;                                      // The asset name code (i.e. BTC, ETH, SOL, etc.)
  final double dailyChangePercentage;                     // Change in asset value over the past day (percentage)
  final double weeklyChangePercentage;                    // Change in asset value over the past week (percentage)
  final double monthlyChangePercentage;                   // Change in asset value over the past month (percentage)
  final double threeMonthlyChangePercentage;              // Change in asset value over the past 3 months (percentage)
  final double yearlyChangePercentage;                    // Change in asset value over the past year (percentage)
  final double maxChangePercentage;                       // Change in asset value over the max interval (percentage)
  final double amountOwned;                               // The amount of the asset owned
  final double pricePerToken;                             // The price per token
  double get valueOwned => amountOwned * pricePerToken;   // The value of the asset that the customer owns
}

enum DisplayRange {
  daily,
  weekly,
  monthly,
  threeMonthly,
  yearly,
  maximum,
}
