import 'package:flutter/material.dart'
import 'package:valencyapp/components/bigbutton.dart'
import 'package:valencyapp/components/exitbutton.dart'
import 'package:valencyapp/components/dropdownselector.dart'

class FundAccountScreen extends StatelessWidget {
  FundAccountScreen({super.key});

  // I/O Controllers
  final paymentMethodController = TextEditingController();   // Reads payment method
  void deposit() {}                                          // Called when the deposit button is pressed
  void exit() {}                                             // Called when the exit button is pressed

  // Adding a new online banking account
  void addNewBankAccount() {}                                    // Called when the add new bank account button is pressed
  final accountNumberController = TextEditingController();       // Reads account number
  final bsbController = TextEditingController();                 // Reads BSB
  final accountHolderNameController = TextEditingController();   // Reads name of account holder
  void verifyBankAccount() {}                                    // Called when the verify bank account button is pressed

  // Funding via bank card
  final cardNumberController = TextEditingController();       // Reads card number
  final nameOnCardController = TextEditingController();       // Reads cardholder name
  final expirationDateController = TextEditingController();   // Reads expiration date of card
  final ccvController = TextEditingController();              // Reads CCV
  final saveCardController = TextEditingController();         // Reads whether to save card

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: const[

              const FractionallySizedBox(widthFactor: 1, heightFactor: 0.02),  // Gap between top and content

              ValencyExitButton(
                onTap: exit,
              ),
              
              const FractionallySizedBox(widthFactor: 1, heightFactor: 0.08),  // Gap between top and content

              Text('Fund Your Account', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 64
                ),
                textAlign: TextAlign.center,
              ),

              const FractionallySizedBox(widthFactor: 1, heightFactor: 0.04),  // Gap between title and select amount

              Text('SELECT AMOUNT', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 32
                ),
              ),

              ValencyFIATAmount(

              ),

              const FractionallySizedBox(widthFactor: 1, heightFactor: 0.04),  // Gap between select amount and payment method

              Text('PAYMENT METHOD', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 32
                ),
              ),

              ValencyDropDownSelector(
                controller: controller, 
                borderColor: borderColor, 
                options: "Credit/Debit Card"  // Array with options goes here - need to initialise
              ),

              const SizedBox(height: 25),   // Gap between input fields and deposit button

              ValencyBigButton(
                onTap: deposit, 
                buttonColor: Colors.green, 
                hintText: 'DEPOSIT'
              ),



            ],
          ),
        ),
      ),
    );
  }
}