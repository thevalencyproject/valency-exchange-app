import 'package:flutter/material.dart';
import 'package:valencyapp/components/bigbutton.dart';
import 'package:valencyapp/components/exitbutton.dart';
import 'package:valencyapp/components/dropdownselector.dart';
import 'package:valencyapp/components/banking/fiatamountselector.dart';
import 'package:valencyapp/components/textbutton.dart';

class WithdrawScreen extends StatelessWidget {
  WithdrawScreen({super.key});

  int isOnlineBankingLinked = 1;   // Not linked by default until backend system says it is

  // I/O Controllers
  bool methodVerified = false;
  void readyForWithdrawal() { methodVerified = true; }

  final withdrawalAmountController = TextEditingController();   // Reads withdrawal amount
  void withdraw() {}                                            // Called when the withdraw button is pressed
  void exit() {}                                                // Called when the exit button is pressed

  // Adding a new online banking account
  void addNewBankAccount() {}                                    // Called when the add new bank account button is pressed
  final accountNumberController = TextEditingController();       // Reads account number
  final bsbController = TextEditingController();                 // Reads BSB
  final accountHolderNameController = TextEditingController();   // Reads name of account holder
  void verifyBankAccount() {}                                    // Called when the verify bank account button is pressed
  void changeAccount() {}                                        // Called when the change online banking account button is pressed

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

              Text('Withdraw From Account', 
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
                controller: withdrawalAmountController,
                withdrawal: true,
              ),

              const FractionallySizedBox(widthFactor: 1, heightFactor: 0.2),  // Gap between select amount and bank details

              switch(isOnlineBankingLinked) {
              case 1:   // Link Bank Card
                ValencyOnlineBankingPayment(
                  onDetailsVerified: readyForWithdrawal,
                ),
                break;
              case 2:   // Already linked bank card
                ValencyDisplayOnlineBankingDetails(

                ),
                ValencyTextButton(
                  onTap: changeAccount,
                  buttonColor: Colors.blue,
                  buttonText: "Send funds to another account",
                ),
                break;
              }

              const FractionallySizedBox(widthFactor: 1, heightFactor: 0.30),  // Gap between payment processor and deposit button

              switch(methodVerified) {
              case 0:
                ValencyBigButton(
                  onTap: null, 
                  buttonColor: Colors.grey, 
                  hintText: 'WITHDRAW'
                ),
                break;
              case 1:
                ValencyBigButton(
                  onTap: deposit, 
                  buttonColor: Colors.green, 
                  hintText: 'WITHDRAW'
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