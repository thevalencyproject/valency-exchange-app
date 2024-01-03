import 'package:flutter/material.dart';
import 'package:valencyapp/structures/range.dart';
import 'package:valencyapp/structures/walletasset.dart';

/* 
[IMPLEMENTING IN PARENT WIDGET]
ValencyWalletAssetDisplay(
  assets: [], // Pass the actual assets here
  visibleCount: 4,
  isSelectable: true,
  currentRange: currentRange, // Pass the current range
)
*/
class ValencyWalletAssetDisplay extends StatefulWidget {
  ValencyWalletAssetDisplay({
    Key? key,
    required this.assets,
    required this.visibleCount,
    required this.isSelectable,
    required this.currentRange,
  }) : super(key: key);

  final List<ValencyWalletAsset> assets;        // The assets that will be displayed
  final DisplayRange currentRange;              // The range that is displayed (changeable by parent)
  final int visibleCount;                       // How many assets are visible in the widget before having to scroll (height control)
  final bool isSelectable;                      // If the assets are selectable or not (relayed to parent to update graphs, etc)

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
                Text(changePercentage), // The Change Percentage + Dollar Amount Change
              ],
            ),

            Expanded(                   // Value and Amount Owned
              child: Column(
                children: [
                  Text("\$${asset.valueOwned.toStringAsFixed(2)}"),
                  Text("${asset.amountOwned} ${asset.name}"),
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