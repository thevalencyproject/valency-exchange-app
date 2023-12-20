import 'package:flutter/material.dart';

/* Usage:
    -> borderColor: the colour of the border
    -> options: an array of strings (each string = each selection) 
    -> onSelected: a function that is executed when a new option is selected (should take a string as input)
        -> eg. onSelected: (String selectedValue) { do something with selected value here } */
class ValencyDropDownSelector extends StatefulWidget {
  const ValencyDropDownSelector({
    Key? key,
    required this.onSelected,
    required this.borderColor,
    required this.options,
  }) : super(key: key);

  final ValueChanged<String> onSelected;  // Callback when an option is selected
  final Color borderColor;                // Border Colour
  final List<String> options;             // The text options inside the drop down selector

  @override
  _ValencyDropDownSelectorState createState() => _ValencyDropDownSelectorState();
}

class _ValencyDropDownSelectorState extends State<ValencyDropDownSelector> {
  String? _currentSelection;    // First selection is the first option

  @override
  void initState() {
    super.initState();
    if (widget.options.isNotEmpty) {
      _currentSelection = widget.options.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: widget.borderColor),
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),

      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _currentSelection,
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down),
          items: widget.options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _currentSelection = newValue;
            });
            widget.onSelected(newValue!);
          },
          
          // Dropdown Style
          style: TextStyle(color: Colors.black),
          dropdownColor: Colors.white,
        ),
      ),
    );
  }
}
