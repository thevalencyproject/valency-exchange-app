import 'package:flutter/material.dart';
import 'package:valencyapp/structures/walletasset.dart';

/* 
[IMPLEMENTING IN PARENT WIDGET]
class _ParentWidgetState extends State<ParentWidget> {
  DisplayRange currentRange = DisplayRange.daily; // Initial range

  void _updateRange(DisplayRange newRange) {
    setState(() {
      currentRange = newRange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Add buttons or a dropdown to allow users to select the range
        // For instance, a button to switch to weekly:
        ElevatedButton(
          onPressed: () => _updateRange(DisplayRange.weekly),
          child: Text('Weekly'),
        ),
        // Your ValencyWalletAssetDisplay widget
        ValencyWalletAssetDisplay(
          assets: [], // Pass the actual assets here
          visibleCount: 4,
          isSelectable: true,
          currentRange: currentRange, // Pass the current range
          onRangeChange: _updateRange, // Pass the callback to handle range changes
        ),
      ],
    );
  }
}
*/
class ValencyWalletAssetDisplay extends StatefulWidget {
  ValencyWalletAssetDisplay({
    Key? key,
    required this.assets,
    required this.visibleCount,
    required this.isSelectable,
    required this.currentRange,
    required this.onRangeChange,
  }) : super(key: key);

  final List<ValencyWalletAsset> assets;        // The assets that will be displayed
  final DisplayRange currentRange;              // The range that is displayed (changeable by parent)
  final int visibleCount;                       // How many assets are visible in the widget before having to scroll (height control)
  final bool isSelectable;                      // If the assets are selectable or not (relayed to parent to update graphs, etc)
  final Function(DisplayRange) onRangeChange;   // Callback to notify parent

  @override
  _ValencyWalletAssetDisplayState createState() => _ValencyWalletAssetDisplayState();
}

class _ValencyWalletAssetDisplayState extends State<ValencyWalletAssetDisplay> {
  int? selectedAssetIndex;

  @override
  Widget build(BuildContext context) {
    double assetItemHeight = 100.0;   // The height that one asset takes up (used to calculate visibleCount height)

    return Container(
      height: widget.visibleCount * assetItemHeight,
      child: ListView.builder(
        itemCount: widget.assets.length,
        itemBuilder: (context, index) {
          return _buildAssetItem(widget.assets[index], index);
        },
      ),
    );
  }

  void selectAsset(int index) {
    setState(() {
      selectedAssetIndex = index == selectedAssetIndex ? null : index;
    });
  }

  String getChangePercentage(ValencyWalletAsset asset, DisplayRange range) {
    switch(range) {
    case DisplayRange.daily:
      return "${asset.dailyChangePercentage}";
    case DisplayRange.weekly:
      return "${asset.weeklyChangePercentage}";
    case DisplayRange.monthly:
      return "${asset.monthlyChangePercentage}";
    case DisplayRange.threeMonthly:
      return "${asset.threeMonthlyChangePercentage}";
    case DisplayRange.yearly:
      return "${asset.yearlyChangePercentage}";
    case DisplayRange.maximum:
      return "${asset.maxChangePercentage}";
    default:
      return "${asset.dailyChangePercentage}";
    }
  }

  Widget _buildAssetItem(ValencyWalletAsset asset, int index) {
    String changePercentage = getChangePercentage(asset, widget.currentRange);

    return GestureDetector(   // Use GestureDetector to handle taps if widget.isSelectable
      onTap: widget.isSelectable ? () => setState(() => selectedAssetIndex = index) : null,
      child: Container(
        decoration: BoxDecoration(    // Decorate with border if selected
          border: selectedAssetIndex == index ? Border.all(color: Colors.blue) : null,
        ),
        child: Row(
          children: [
            
            Image.asset(asset.icon),    // Asset Icon
            
            Column(                     // Asset Name and Changes
              children: [
                Text(asset.name),
                Text(changePercentage), // The Change Percentage
              ],
            ),

            Expanded(                   // Value and Amount Owned
              child: Column(
                children: [
                  Text("\$${asset.valueOwned.toStringAsFixed(2)}"),
                  Text("${asset.amountOwned} units"),
                ],
              ),
            ),
            
            Text("\$${asset.pricePerToken.toStringAsFixed(2)}"),    // Price per Token
          ],
        ),
      ),
    );
  }
}