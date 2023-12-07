import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ValencyFIATAmountSelector extends StatelessWidget {
  final controller;       // The controller that can access the contents of the input field
  final bool withdrawal;  // True if withdrawal (for calculating what balance will be after transaction)

  const ValencyFIATAmountSelector({
    super.key,
    required this.controller,
    required this.withdrawal,
  });

  @override
  Widget build(BuildContext context) {
    
  }
}