import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:valencyapp/components/dropdownselector.dart';

class ValencyFIATAmountSelector extends StatefulWidget {
  const ValencyFIATAmountSelector({
    Key? key,
    required this.amountController,
    required this.currencyChanged,
    required this.currencies,
    required this.currencyRates,
    required this.currentBalanceUSD,
    required this.isWithdrawal,
  }) : super(key: key);

  final TextEditingController amountController;       // Allows parent to see the amount the user inputs into the text field
  final ValueChanged<String> currencyChanged;         // Callback function called when a new currency is selected (to notify parent)
  final List<String> currencies;                      // A list of all available currencies (AUD, USD, EUR, GBP, etc)
  final ValueNotifier<List<double>> currencyRates;    // A list of currency exchange rates (from USD)
  final double currentBalanceUSD;                     // The current balance in USD
  final bool isWithdrawal;                            // If the widget is for a withdrawal or deposit

  @override
  _ValencyFIATAmountSelectorState createState() => _ValencyFIATAmountSelectorState();
}

class _ValencyFIATAmountSelectorState extends State<ValencyFIATAmountSelector> {
  late String selectedCurrency;   // Must initialise as late to avoid error (given value in initState anyway)
  double conversionRate = 1.0;    // Default conversion rate for USD (since conversion list is from USD to everything else)

  @override
  void initState() {
    super.initState();
    selectedCurrency = widget.currencies.first;                   // First currency is USD
    widget.currencyRates.addListener(_updateConversionRates);     // For relaying to parent
  }

  @override
  void dispose() {
    widget.currencyRates.removeListener(_updateConversionRates);
    super.dispose();
  }

  // [For dynamic updating] Called whenever currencyRates changes (if rates go up or down for any currency in the list)
  void _updateConversionRates() {   // Currency/Conversion Arrays share index positions
    setState(() {
      int currencyIndex = widget.currencies.indexOf(selectedCurrency);
      conversionRate = widget.currencyRates.value[currencyIndex];
    });
  }

  void _onCurrencySelected(String currency) {
    setState(() {
      selectedCurrency = currency;
      int currencyIndex = widget.currencies.indexOf(currency);
      conversionRate = widget.currencyRates.value[currencyIndex];
    });
    widget.currencyChanged(currency);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('SELECT AMOUNT'),
        Row(
          children: [
            Expanded(
              child: TextField(   // Not using ValencyTextField, as don't want a border arount the text field
                controller: widget.amountController,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 104,                  // Input text bigger than prefix
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixText: '\$',               // $ sign for the prefix
                  prefixStyle: TextStyle(         // Prefix is smaller than input text
                    color: Colors.black,
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            ValencyDropDownSelector(
              onSelected: _onCurrencySelected,
              borderColor: Colors.blue,
              options: widget.currencies,
            ),
          ],
        ),
        Text(
          _calculateTransactionAmountText(),
        ),
      ],
    );
  }

  String _calculateTransactionAmountText() {
    double amount = double.tryParse(widget.amountController.text) ?? 0.0;
    double convertedAmount = amount * conversionRate;
    double newBalance = widget.currentBalanceUSD + (widget.isWithdrawal ? -convertedAmount : convertedAmount);

    return 'This will take your account balance from \$${widget.currentBalanceUSD.toStringAsFixed(2)} to \$${newBalance.toStringAsFixed(2)}';
  }
}