import 'package:flutter/material.dart';
import 'package:valencyapp/structures/range.dart';
import 'package:valencyapp/structures/position.dart';

/* 
[IMPLEMENTING IN PARENT WIDGET]
ValencyPositionDisplay(
  assets: [], // Pass the actual assets here
  visibleCount: 4,
  isSelectable: true,
  currentRange: currentRange,   // Pass the current range
  editController: edit,         // Pass the edit function
  closeController: close,       // Pass the close function
)
*/
class ValencyPositionDisplay extends StatefulWidget {
  ValencyPositionDisplay({
    Key? key,
    required this.positions,
    required this.visibleCount,
    required this.isSelectable,
    required this.currentRange,
    required this.editController,
    required this.closeController,
  }) : super(key: key);

  final List<ValencyPosition> positions;        // The positions that will be displayed
  final DisplayRange currentRange;              // The range that is displayed (changeable by parent)
  final int visibleCount;                       // How many assets are visible in the widget before having to scroll (height control)
  final bool isSelectable;                      // If the assets are selectable or not (relayed to parent to update graphs, etc)
  final Function(int index) editController;     // Function called when the edit button is pressed (includes position index from list)
  final Function(int index) closeController;    // Function called when the close button is pressed (includes position index from list)

  @override
  _ValencyPositionDisplayState createState() => _ValencyPositionDisplayState();
}

class _ValencyPositionDisplayState extends State<ValencyPositionDisplay> {
  int? selectedPositionIndex;

  @override
  Widget build(BuildContext context) {
    double positionItemHeight = 100.0;   // The height that one asset takes up (used to calculate visibleCount height)

    return Container(
      height: widget.visibleCount * positionItemHeight,
      child: ListView.builder(
        itemCount: widget.positions.length,
        itemBuilder: (context, index) {
          return _buildPositionItem(widget.positions[index], index);
        },
      ),
    );
  }

  void selectAsset(int index) {
    setState(() {
      selectedPositionIndex = index == selectedPositionIndex ? null : index;
    });
  }

  String getChangePercentage(ValencyPosition position, DisplayRange range) {
    switch(range) {
    case DisplayRange.daily:
      return "${position.dailyChangePercentage}";
    case DisplayRange.weekly:
      return "${position.weeklyChangePercentage}";
    case DisplayRange.monthly:
      return "${position.monthlyChangePercentage}";
    case DisplayRange.threeMonthly:
      return "${position.threeMonthlyChangePercentage}";
    case DisplayRange.yearly:
      return "${position.yearlyChangePercentage}";
    case DisplayRange.maximum:
      return "${position.maxChangePercentage}";
    default:
      return "${position.dailyChangePercentage}";
    }
  }

  Widget _buildPositionItem(ValencyPosition position, int index) {
    String changePercentage = getChangePercentage(position, widget.currentRange);

    return GestureDetector(           // Use GestureDetector to handle taps if widget.isSelectable
      onTap: widget.isSelectable ? () => setState(() => selectedPositionIndex = index) : null,
      child: Container(
        decoration: BoxDecoration(    // Decorate with border if selected
          border: selectedPositionIndex == index ? Border.all(color: Colors.blue) : null,
        ),
        child: Row(
          children: [
            
            Image.asset(position.icon),    // Asset Icon
            
            Column(                        // Asset Name and Changes
              children: [
                Text(position.name),
                Text(changePercentage),    // The Change Percentage + Dollar Amount Change
              ],
            ),

            Expanded(                      // Number of Contracts and the Opening Rate
              child: Column(
                children: [
                  Text("Sell ${position.numOfContracts.toStringAsFixed(2)} Contracts"),
                  Text("Open Rate: \$${position.openingRate} ${position.name}"),
                ],
              ),
            ),
            
            Expanded(                     // Expiry and Leverage
              child: Column(
                children: [
                  Text("Exp: ${position.expiry}"),
                  Text("Leverage: ${position.leverage}"),
                ],
              ),
            ),

            Expanded(                     // Edit and Close Position Buttons
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: widget.editController(index),
                    child: Text('Edit'),
                  ),

                  SizedBox(height: 2),   // Spacing between buttons

                  ElevatedButton(
                    onPressed: widget.closeController(index),
                    child: Text('Close'),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}