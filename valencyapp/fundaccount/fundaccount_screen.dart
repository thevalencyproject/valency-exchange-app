import 'package:flutter/material.dart';
import 'package:valencyapp/components/bigbutton.dart';
import 'package:valencyapp/components/exitbutton.dart';
import 'package:valencyapp/components/dropdownselector.dart';
import 'package:valencyapp/components/banking/fiatamountselector.dart';

class FundAccountScreen extends StatelessWidget {
  FundAccountScreen({super.key});

  final List<String> paymentMethods = ["Credit/Debit Card", "Online Banking"];
  int selectedPaymentMethod = 1;                                                  // 1 = Credit/Debit Card, 2 = Online Banking
  int isBankCardLinked = 1;                                                       // Not linked by default until backend system says it is
  int isOnlineBankingLinked = 1;                                                  // Not linked by default until backend system says it is

  // I/O Controllers
  bool methodVerified = false;
  void readyForPurchase() { methodVerified = true; }

  final paymentMethodController = TextEditingController();   // Reads payment method
  final paymentAmountController = TextEditingController();   // Reads payment amount
  void deposit() {}                                          // Called when the deposit button is pressed
  void exit() {}                                             // Called when the exit button is pressed

  // Adding a new online banking account
  void addNewBankAccount() {}                                    // Called when the add new bank account button is pressed
  final accountNumberController = TextEditingController();       // Reads account number
  final bsbController = TextEditingController();                 // Reads BSB
  final accountHolderNameController = TextEditingController();   // Reads name of account holder
  void verifyBankAccount() {}                                    // Called when the verify bank account button is pressed
  void changeAccount() {}                                        // Called when the change online banking account button is pressed

  // Funding via bank card
  final cardNumberController = TextEditingController();       // Reads card number
  final nameOnCardController = TextEditingController();       // Reads cardholder name
  final expirationDateController = TextEditingController();   // Reads expiration date of card
  final ccvController = TextEditingController();              // Reads CCV
  final saveCardController = TextEditingController();         // Reads whether to save card
  void changeBankCard() {}                                    // Called when the change bank card button is pressed

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

              ValencyFIATAmountSelector(
                controller: paymentAmountController,
                withdrawal: false,
              ),

              const FractionallySizedBox(widthFactor: 1, heightFactor: 0.04),  // Gap between select amount and payment method

              Text('PAYMENT METHOD', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 32
                ),
              ),

              ValencyDropDownSelector(
                controller: paymentMethodController, 
                borderColor: Colors.blue, 
                options: paymentMethods,
              ),

              const FractionallySizedBox(widthFactor: 1, heightFactor: 0.04),  // Gap between payment method and payment processor

              switch(selectedPaymentMethod) {   // Payment Processor
                case 1:   // Bank Card

                  switch(isBankCardLinked) {
                    case 1:   // Link Bank Card
                      ValencyBankCardPayment(
                        onDetailsVerified: readyForPurchase,
                      ),
                      break;
                    case 2:   // Already linked bank card
                      ValencyDisplayBankCardDetails(

                      ),
                      ValencyTextButton(
                        onTap: changeBankCard,
                        buttonColor: Colors.blue,
                        buttonText: "Deposit from another card",
                      ),
                      readyForPurchase();
                      break;
                  }
                  break;
                case 2:   // Online Banking

                  switch(isOnlineBankingLinked) {
                    case 1:   // Link Online Banking
                      ValencyOnlineBankingPayment(
                        onDetailsVerified: readyForPurchase,
                      ),
                      break;
                    case 2:   // Already Linked Online Banking
                      ValencyDisplayOnlineBankingDetails(

                      ),
                      ValencyTextButton(
                        onTap: changeAccount,
                        buttonColor: Colors.blue,
                        buttonText: "Deposit from another account",
                      ),
                      readyForPurchase();
                      break;
                  }

                  break;
              }

              const FractionallySizedBox(widthFactor: 1, heightFactor: 0.30),  // Gap between payment processor and deposit button

              switch(methodVerified) {
              case 0:
                ValencyBigButton(
                  onTap: null, 
                  buttonColor: Colors.grey, 
                  hintText: 'DEPOSIT'
                ),
                break;
              case 1:
                ValencyBigButton(
                  onTap: deposit, 
                  buttonColor: Colors.green, 
                  hintText: 'DEPOSIT'
                ),
                break;
              }



            ],
          ),
        ),
      ),
    );
  }
}