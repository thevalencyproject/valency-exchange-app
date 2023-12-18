import 'package:flutter/material.dart';
import 'basegraph.dart';                  // To access the selected range

class ValencyRangeButtons extends StatelessWidget {
  const ValencyRangeButtons({
    Key? key,
    required this.selectedRange,
    required this.onRangeSelected,
  }) : super(key: key);

  final SelectedRange selectedRange;
  final Function(SelectedRange) onRangeSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: SelectedRange.values.map((range) => _buildButton(range)).toList(),
    );
  }

  Widget _buildButton(SelectedRange range) {
    return ElevatedButton(
      onPressed: () => onRangeSelected(range),
      child: Text(_rangeToString(range)),
      style: ElevatedButton.styleFrom(
        primary: range == selectedRange ? Colors.blue : Colors.grey,
      ),
    );
  }

  String _rangeToString(SelectedRange range) {
    switch(range) {
      case SelectedRange.day:
        return '1D';
      case SelectedRange.week:
        return '1W';
      case SelectedRange.month:
        return '1M';
      case SelectedRange.threeMonths:
        return '3M';
      case SelectedRange.year:
        return '1Y';
      case SelectedRange.max:
        return 'MAX';
      default:
        return '';
    }
  }
}