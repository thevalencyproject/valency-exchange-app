import 'package:flutter/material.dart';
import 'package:valencyapp/structures/range.dart';

class ValencyRangeButtons extends StatelessWidget {
  const ValencyRangeButtons({
    Key? key,
    required this.selectedRange,
    required this.onRangeSelected,
  }) : super(key: key);

  final DisplayRange selectedRange;
  final Function(DisplayRange) onRangeSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: DisplayRange.values.map((range) => _buildButton(range)).toList(),
    );
  }

  Widget _buildButton(DisplayRange range) {
    return ElevatedButton(
      onPressed: () => onRangeSelected(range),
      child: Text(_rangeToString(range)),
      style: ElevatedButton.styleFrom(
        primary: range == selectedRange ? Colors.blue : Colors.grey,
      ),
    );
  }

  String _rangeToString(DisplayRange range) {
    switch(range) {
      case DisplayRange.daily:
        return '1D';
      case DisplayRange.weekly:
        return '1W';
      case DisplayRange.monthly:
        return '1M';
      case DisplayRange.threeMonthly:
        return '3M';
      case DisplayRange.yearly:
        return '1Y';
      case DisplayRange.maximum:
        return 'MAX';
      default:
        return '';
    }
  }
}