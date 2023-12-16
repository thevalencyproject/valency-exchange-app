// Variables given to the explore screen when drawing to screen:
// 1. FIAT Balance Amount (for top right display)
// 2. This months 6 popular lists - lists and icons are embedded in the application, so no need to use bandwidth for them
// 3. Assets that are trending today (a list of multiple) - icons are embedded in the application, so no need to use bandwidth for them
// 4. Current cryptocurrency news segment (all 3) - Title, link, description, and image for each

// Search
final int amountOfFIATFunds;                            // [Uses Bandwidth] The amount of FIAT funds in the Valency account
List<String> allAvailableAssets = [];                   // [Uses Bandwidth] All available assets (if cached and no update since cache, this will use cached data (price data still needs updating though))
List<double> allAvailableAssetsPrice = [];              // [Uses Bandwidth] Price data for each available asset
List<double> allAvailableAssetsPercentageChange = [];   // [Uses Bandwidth] Percentage Change for each available asset in the last 24 hours

// Popular Lists
List<String> popularListsNames = [];    // [Uses Bandwidth] A list of each popular list (in order of how popular)
List<Image> popularListImages = [];     // [Calculated Locally] Images to accompany each list (stored locally - match list name to image)

// Trending Today
List<int> trendingTodayIndex = [];                // [Uses Bandwidth] The indexes of the assets that are trending today (15 per day)(index should be for the allAvailableAssets array)
List<double> trendingTodayPercentageChange = [];  // [Calculated Locally] Percentage Change for each trending today asset in the last 24 hours - gotten locally from the all available assets list (using trendingTodayIndex as an index)
List<String> trendingTodayAssetName = [];         // [Calculated Locally] The name of each asset in the trending today section - Gotten locally from the all available assets list (using trendingTodayIndex as an index)
List<double> trendingTodayPrices = [];            // [Calculated Locally] The price of each asset in the trending today section - Gotten locally from the all available assets list (using trendingTodayIndex as an index)
List<Image> trendingTodayIcon = [];               // [Calculated Locally] Icons to accompany each asset (stored locally - match asset name to icon)

// News
List<double> newsTitles = [];               // [Uses Bandwidth] The news titles
List<String> newsDescriptions = [];         // [Uses Bandwidth] The news descriptions
List<String> newsPublishers = [];           // [Uses Bandwidth] The news publishers
List<DateTime> newsPublicationTimes = [];   // [Uses Bandwidth] The news publication times
List<Image> newsImages = [];                // [Uses Bandwidth] The news images