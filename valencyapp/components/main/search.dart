import 'package:flutter/material.dart';
import 'package:valencyapp/components/textfield.dart';

// This widget is responsible for search functionality
// Name: ValencySearchBar
// Takes in: All searchable terms
//           All searchable terms price
// WHERE TO GO ON EACH SEARCH IS DONE BY INPUTTING THE SELECTED SEARCHABLE TERM (AKA. BTC) INTO THE BUYASSET SCREEN INPUT (STILL NEEDS TO BE IMPLEMENTED)

// Input Variables: searchable, searchablePrices, searchablePercentages
// searchable (string to identify assets), searchablePrices (current prices of these assets), searchablePercentages (a percentage change of each asset over a specific time period)
class ValencySearchBar extends StatefulWidget {
  ValencySearchBar({
    super.key,
    required this.searchable,
    this.searchablePrices,
    this.searchablePercentages,
  });

  final List<String> searchable = [];
  final List<double> searchablePrices = [];
  final List<double> searchablePercentages = [];
  
  @override_ValencySearchBarState createState() => _ValencySearchBarState();
}

class _ValencySearchBarState extends State<ValencySearchBar> {
  TextEditingController searchBarInput = TextEditingController();
  List<int> suggestionIndices = [];   // A list of the suggestions

  @override
  void initState() {
    super.initState();
    searchBarInput.addListener(_updateSuggestions);
  }

  void _updateSuggestions() {
    String input = searchBarInput.text.toLowerCase();
    setState(() {
      suggestionIndices = widget.searchable
        .asMap()
        .entries
        .where((entry) => entry.value.toLowerCase().startsWith(input))
        .map((entry) => entry.key)
        .toList();
    });
  }

  @override
  void dispose() {
    searchBarInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ValencyTextField(
          controller: searchBarInput,
          hintText: 'Search',
          obscureText: false,
        ),

        _buildSuggestionsList(),
      ],
    );
  }

  Widget _buildSuggestionsList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: suggestionIndices.length,
      itemBuilder: (context, index) {
        int suggestionIndex = suggestionIndices[index];
        String item = widget.searchable[suggestionIndex];
        double price = widget.searchablePrices[suggestionIndex];
        double percentage = widget.searchablePercentages[suggestionIndex];

        return ListTile(
          title: Text('$item - \$${price.toStringAsFixed(2)} (${percentage.toStringAsFixed(2)}%)'),

          onTap: () {
            // Suggestion selected event logic goes here - pass through selected searchable element into asset overview screen function
            // Send selected searchable list element through controller and display route through parents to display
            
            print('Selected: $item');
          },
        );
      }
    );
  }
}