import 'package:flutter/material.dart';
import 'package:valencyapp/structures/range.dart';
import 'package:valencyapp/structures/trendingtoday.dart';

class ValencyTrendingTodayDisplay extends StatefulWidget {
  ValencyTrendingTodayDisplay({
    Key? key,
    required this.assets,
    required this.visibleCount,
    required this.onRangeChange,
  }) : super(key: key);

  final List<ValencyTrendingToday> assets;      // The assets that will be displayed
  final int visibleCount;                       // How many assets are visible in the widget before having to scroll (height control)
  final Function(DisplayRange) onRangeChange;   // Buy button has been pressed

  @override
  _ValencyTrendingTodayDisplayState createState() => _ValencyTrendingTodayDisplayState();
}

class _ValencyTrendingTodayDisplayState extends State<ValencyTrendingTodayDisplay> {
  int? selectedAssetIndex;

  @override
  Widget build(BuildContext context) {
    double assetItemHeight = 100.0;   // The height that one asset takes up (used to calculate visibleCount height)

    return Container(
      height: widget.visibleCount * assetItemHeight,
      child: ListView.builder(
        itemCount: widget.assets.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(widget.assets[index].name),
            background: slideRightBackground(),           // Primary Background - what shows before any swipes
            secondaryBackground: slideLeftBackground(),   // Secondary Background - what shows after a right swipe
            onDismissed: (direction) {
              setState(() {
                if(direction == DismissDirection.endToStart) {
                  selectedAssetIndex = null;    // Reset swipe
                } else {
                  selectedAssetIndex = index;   // Set swiped item
                }
              });
            },

            child: _buildTrendingItem(widget.assets[index], index),
          );
        },
      ),
    );
  }

  Widget _buildTrendingItem(ValencyTrendingToday asset, int index) {
    bool isSelected = selectedAssetIndex == index;    // True if the asset is selected

    return Container(
      height: 100.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          if(!isSelected) ...[
            Image.asset(asset.icon),    // Show asset icon only if not selected
            Text(asset.name),
          ],

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('\$${asset.price.toStringAsFixed(2)}'),
                Text('${asset.dailyChangePercentage.toStringAsFixed(2)}%'),
              ],
            ),
          ),

          if(isSelected) ...[
            // BUTTONS GO HERE
            // 1. Buy
            // 2. Positions
            // 3. Details
          ],

        ]
      )
    );    
  }

  Widget slideRightBackground() {
    return Container(
      color: Colors.blue,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 20),
            Icon(Icons.arrow_back, color: Colors.white),
            SizedBox(width: 20),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.blue,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(Icons.arrow_forward, color: Colors.white),
            SizedBox(width: 20),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}