import 'package:flutter/material.dart';
import 'package:valencyapp/components/main/search.dart';
import 'package:valencyapp/components/main/fundsdisplay.dart';
import 'package:valencyapp/components/main/bottombar/bottombar.dart';

// The variables passed through should be changed to pointers!!
class ExploreScreen extends StatelessWidget {
  ExploreScreen({
    super.key,
    required this.amountOfFIATFunds,
    required this.allAvailableAssets,
    required this.allAvailableAssetsPrice,
    required this.allAvailableAssetsPercentageChange,
    required this.popularListsNames,
    required this.popularListImages,
    required this.trendingTodayIndex,
    required this.trendingTodayPercentageChange,
    required this.trendingTodayAssetName,
    required this.trendingTodayPrices,
    required this.trendingTodayIcon,
    required this.newsTitles,
    required this.newsDescriptions,
    required this.newsPublishers,
    required this.newsPublicationTimes,
    required this.newsImages,
  });

  // Search
  final int amountOfFIATFunds;                                  // [Uses Bandwidth] The amount of FIAT funds in the Valency account
  final List<String> allAvailableAssets = [];                   // [Uses Bandwidth] All available assets (if cached and no update since cache, this will use cached data (price data still needs updating though))
  final List<double> allAvailableAssetsPrice = [];              // [Uses Bandwidth] Price data for each available asset
  final List<double> allAvailableAssetsPercentageChange = [];   // [Uses Bandwidth] Percentage Change for each available asset in the last 24 hours

  // Popular Lists - 6 most popular lists, lists & icons embedded to save bandwidth
  final List<String> popularListsNames = [];    // [Uses Bandwidth] A list of each popular list (in order of how popular)
  final List<Image> popularListImages = [];     // [Calculated Locally] Images to accompany each list (stored locally - match list name to image)

  // Trending Today - names & icons are embedded to save bandwidth
  final List<int> trendingTodayIndex = [];                // [Uses Bandwidth] The indexes of the assets that are trending today (15 per day)(index should be for the allAvailableAssets array)
  final List<double> trendingTodayPercentageChange = [];  // [Calculated Locally] Percentage Change for each trending today asset in the last 24 hours - gotten locally from the all available assets list (using trendingTodayIndex as an index)
  final List<String> trendingTodayAssetName = [];         // [Calculated Locally] The name of each asset in the trending today section - Gotten locally from the all available assets list (using trendingTodayIndex as an index)
  final List<double> trendingTodayPrices = [];            // [Calculated Locally] The price of each asset in the trending today section - Gotten locally from the all available assets list (using trendingTodayIndex as an index)
  final List<Image> trendingTodayIcon = [];               // [Calculated Locally] Icons to accompany each asset (stored locally - match asset name to icon)

  // News - all uses bandwidth (news segments from news companies)
  final List<double> newsTitles = [];               // [Uses Bandwidth] The news titles
  final List<String> newsDescriptions = [];         // [Uses Bandwidth] The news descriptions
  final List<String> newsPublishers = [];           // [Uses Bandwidth] The news publishers
  final List<DateTime> newsPublicationTimes = [];   // [Uses Bandwidth] The news publication times
  final List<Image> newsImages = [];                // [Uses Bandwidth] The news images

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

              Text('Explore', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 96
                ),
              ),

              ValencySearchBar(
                searchable: allAvailableAssets,
                searchablePrices: allAvailableAssetsPrice,
                searchablePercentages: allAvailableAssetsPercentageChange,
              ),

              // POPULAR LISTS GOES HERE

              // TRENDING TODAY GOES HERE

              // CRYPTOCURRENCY NEWS GOES HERE

              ValencyBottomBar(
                focusedIcon: 1,
              ),



            ],
          ),
        ),
      ),
    );
  }
}