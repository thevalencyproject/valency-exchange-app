import 'package:flutter/material.dart';
import 'package:valencyapp/components/main/valuegraph/basegraph.dart';
import 'package:valencyapp/components/main/valuegraph/rangebuttons.dart';

/* Graph Automatically updates when data updates
    1. Can have range buttons either: On bottom of the graph(0), On top of the graph(1), or not showing(2).
    2. Can display $ amount and percentage change over the selected range(bool)
    3. Can display the opening rate for a short position(double) */
class ValencyValueGraph extends StatefulWidget {
  ValencyValueGraph({
    Key? key,
    required this.rangeButtons,
    required this.openingRate,
    required this.percentageChangeShowing,
    required this.oneDayIntervals,
    required this.oneWeekIntervals,
    required this.oneMonthIntervals,
    required this.threeMonthIntervals,
    required this.oneYearIntervals,
    required this.maxIntervals,
  }) : super(key: key);

  final int rangeButtons;                    // 0 = range on bottom, 1 = range on top, 2 = no range
  final double openingRate;                  // Non-zero if there should be an opening rate showing on the graph
  final bool percentageChangeShowing;        // If there is percentage change text showing on top of the graph
  final List<double> oneDayIntervals;        // Each asset price every 2 minutes for 1 day (first 720 = first asset, second 720 = second asset)
  final List<double>? oneWeekIntervals;      // Each asset price every 15 minutes for 1 week (first 672 = first asset, second 672 = second asset)
  final List<double>? oneMonthIntervals;     // Each asset price every 30 minutes for 1 month (first 1440 = first asset, second 1440 = second asset)
  final List<double>? threeMonthIntervals;   // Each asset price every 2 hours for 3 months (first 1080 = first asset, second 1080 = second asset)
  final List<double>? oneYearIntervals;      // Each asset price every day for 1 year (first 365 = first asset, second 365 = second asset)
  final List<double>? maxIntervals;          // Divide index by number of assets to get number of week intervals per asset

  @override
  _ValencyValueGraphState createState() => _ValencyValueGraphState();
}

class _ValencyValueGraphState extends State<ValencyValueGraph> {
  SelectedRange _selectedRange = SelectedRange.day;   // Default selected range is day

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            if(widget.percentageChangeShowing) _buildPercentageChangeDisplay(),   // If percentage change is showing
            if(widget.rangeButtons != 2)                                          // If range buttons are showing
              ValencyRangeButtons(
                selectedRange: _selectedRange,
                onRangeSelected: _onRangeSelected,
              ),
            Expanded(
              child: ValencyBaseGraph(
                data: _getCurrentData(),
                selectedRange: _selectedRange,
                openingRate: widget.openingRate != 0.0 ? widget.openingRate : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<double> _getCurrentData() {
    switch(_selectedRange) {
      case SelectedRange.day:
        return widget.oneDayIntervals;
      case SelectedRange.week:
        return widget.oneWeekIntervals ?? [];
      case SelectedRange.month:
        return widget.oneMonthIntervals ?? [];
      case SelectedRange.threeMonths:
        return widget.threeMonthIntervals ?? [];
      case SelectedRange.year:
        return widget.oneYearIntervals ?? [];
      case SelectedRange.max:
        return widget.maxIntervals ?? [];
      default:
        return widget.oneDayIntervals;
    }
  }

  Widget _buildPercentageChangeDisplay() {
    List<double> currentData = _getCurrentData();   // Get the current data being used (the data in selected range)

    // If there is insufficient data, return nothing
    if(currentData.isEmpty || currentData.length < 2) {
      return SizedBox();
    }

    double latestValue = currentData.last;                            // The most recent data value in the input list
    double previousValue = currentData.first;                         // The oldest data value in the input list
    double amountChange = latestValue - previousValue;                // The amount change between the two values
    double percentageChange = (amountChange / previousValue) * 100;   // The percentage change between the two values

    return Container(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "${amountChange.toStringAsFixed(2)} (${percentageChange.toStringAsFixed(2)}%)",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: amountChange >= 0 ? Colors.green : Colors.red,
        ),
      ),
    );
  }

  void _onRangeSelected(SelectedRange range) {
    setState(() {
      _selectedRange = range;
    });
  }
}