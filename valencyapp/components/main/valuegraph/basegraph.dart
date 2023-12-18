import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

enum SelectedRange { day, week, month, threeMonths, year, max }

// Opening rate is optional - range should be a selection from SelectedRange, and data is a list of doubles over said time period
class ValencyBaseGraph extends StatelessWidget {
  const ValencyBaseGraph({
    Key? key,
    required this.data,
    required this.selectedRange,
    this.openingRate,
  }) : super(key: key);

  final List<double> data;
  final SelectedRange selectedRange;
  final double? openingRate;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show:false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: _getSpots(data),
            isCurved: true,
            barWidth: 2,
            colors: [Colors.green],
          ),
        ],

        extraLinesData: _getExtraLines(),
      ),
    );
  }

  List<FlSpot> _getSpots(List<double> data) {
    return data.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value)).toList();
  }

  ExtraLinesData _getExtraLines() {
    return openingRate != null
      ? ExtraLinesData(
        horizontalLines: [
          HorizontalLine(
            y: openingRate!,
            color: Colors.grey
            strokeWidth: 1,
            dashArray: [5, 5],
          ),
        ],
      )
    : ExtraLinesData();
  }
}