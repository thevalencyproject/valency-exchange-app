// 3 Options: range buttons on bottom of graph, range buttons on top of graph, or no range buttons showing
//           AND
//            opening rate for positions showing or not showing
//           AND
//            percentage change over past range on top of graph, or no percentage change
//           AND
//            if graph dynamically updates or not (if so, it uses a ValueListenableBuilder)
import 'package:flutter/material.dart';

class ValencyValueGraph extends StatelessWidget {
  ValencyValueGraph({
    super.key,
    required this.rangeButtons,
    required this.openingRate,
    required this.percentageChangeShowing,
    required this.dynamicallyUpdatedGraph,
    required this.valueListenableBuilder,
    required this.oneDayIntervals,
    required this.oneWeekIntervals,
    required this.oneMonthIntervals,
    required this.threeMonthIntervals,
    required this.oneYearIntervals,
    required this.maxIntervals,
  });

  final int rangeButtons;                        // 0 = range on bottom, 1 = range on top, 2 = no range
  final double openingRate;                      // Non-zero if there should be an opening rate showing on the graph
  final bool percentageChangeShowing;            // If there is percentage change text showing on top of the graph
  final bool dynamicallyUpdatedGraph;            // If the graph is dynamically updated
  final Widget valueListenableBuilder;           // A ValueListenableBuilder for dynamic graph updating (set to NULL if no dynamic updating)
  final List<double> oneDayIntervals = [];       // Each asset price every 2 minutes for 1 day (first 720 = first asset, second 720 = second asset)
  final List<double> oneWeekIntervals = [];      // Each asset price every 15 minutes for 1 week (first 672 = first asset, second 672 = second asset)
  final List<double> oneMonthIntervals = [];     // Each asset price every 30 minutes for 1 month (first 1440 = first asset, second 1440 = second asset)
  final List<double> threeMonthIntervals = [];   // Each asset price every 2 hours for 3 months (first 1080 = first asset, second 1080 = second asset)
  final List<double> oneYearIntervals = [];      // Each asset price every day for 1 year (first 365 = first asset, second 365 = second asset)
  final List<double> maxIntervals = [];          // Divide index by number of assets to get number of week intervals per asset

  // I/O Controllers
  void switchType() {}          // Called when switch avaliable/equity button is pressed - redraws display with other type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: const[


              switch(rangeButtons) {
              case 0:
                switch(openingRateShowing) {
                case false:
                  switch(percentageChangeShowing) {
                  case false:

                    break;
                  case true:

                    break;
                  }
                  break;
                case true:
                  switch(percentageChangeShowing) {
                  case false:

                    break;
                  case true:

                    break;
                  }
                  break;
                }

                break;
              case 1:
                switch(openingRateShowing) {
                case false:
                  switch(percentageChangeShowing) {
                  case false:

                    break;
                  case true:

                    break;
                  }
                  break;
                case true:
                  switch(percentageChangeShowing) {
                  case false:

                    break;
                  case true:

                    break;
                  }
                  break;
                }

                break;
              case 2:
                switch(openingRateShowing) {
                case false:
                  switch(percentageChangeShowing) {
                  case false:

                    break;
                  case true:

                    break;
                  }
                  break;
                case true:
                  switch(percentageChangeShowing) {
                  case false:

                    break;
                  case true:

                    break;
                  }
                  break;
                }

                break;
              }



            ],
          ),
        ),
      ),
    );
  }
}