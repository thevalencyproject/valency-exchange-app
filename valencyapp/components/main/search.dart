import 'package:flutter/material.dart';

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
  final searchBarInput = TextEditingController();   // Reads input in the text field

  // Below is refreshed each time a new character is typed into the text field
  List<String> suggestions = [];          // Generate a new suggestions list to go with the input
  for(int i = 0; i < searchable.length; i++) {
    String temp = searchable.elementAt(i);                   // Create a temporary string to hold the searchable term
    temp.substring(1, /*SEARCHBARINPUT.LENGTH*/)   // Size temp to the input length
    if(/* SEARCHBARINPUT */ == temp) {             // If the input is equal to part of the searchable, add the full searchable term to suggestions
      suggestions.add(searchable.elementAt(i));
    }
  }
  if(suggestions.length == 0) {   // If there are no suggestions based on the input
    // DISPLAY NO SEARCH RESULTS TEXT HERE
  } else {
    // DISPLAY SUGGESTIONS LIST HERE
  }
}