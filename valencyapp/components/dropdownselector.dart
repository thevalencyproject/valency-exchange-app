import 'package:flutter/material.dart';

class ValencyDropDownSelector extends StatelessWidget {
  final controller;              // The controller that can access the selection
  final Color borderColor;       // Border Colour
  final List<String> options;    // The text options inside the drop down selector

  const ValencyDropDownSelector({
    super.key,
    required this.controller,
    required this.borderColor,
    required this.options,
  });

  int currentSelection = 1;      // The current selection (index)

  // Gets called when an option from the drop down is selection
  void selectOption(int selection) {
    currentSelection = selection;

    @override
    Widget build(BuildContext context) {
      // options[1] to get selected text
      // this should include another onTap function for when another selection is made -> this sets currentSelection to what is pressed
    }
  }

  // Gets called when the drop down is opened
  void openDropDown() {
    @override
    Widget build(BuildContext context) {
      // options[1] to get selected text
      // this should include another onTap function for when another selection is made -> this sets currentSelection to what is pressed

      // CALL selectOption(selection index goes here) to set selection and redraw the component
    }
  }

  // Displayed before anything is pressed
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openDropDown,
      // Insert content here
    );
  }
}