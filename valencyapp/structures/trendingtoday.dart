/* A structure for each trending today asset in the 'Explore' section of the app
    -> Used as input for the ValencyTrendingTodayDisplay widget. */
class ValencyTrendingToday {
  ValencyTrendingToday({
    required this.icon,
    required this.name,
    required this.price,
    required this.dailyChangePercentage,
  });

  final String icon;                     // A link to the icon (ensure this is local)
  final String name;                     // The full asset name code (i.e. Bitcoin, Ethereum, Solana, etc.)
  final double price;                    // The current price of the asset
  final double dailyChangePercentage;    // Change in asset value over the day (percentage)
}