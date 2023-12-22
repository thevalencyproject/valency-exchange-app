import 'package:flutter/material.dart';
import 'package:valencyapp/components/textfield.dart';
import 'package:valencyapp/components/textbutton.dart';

class ValencyOnlineBankingPayment extends StatelessWidget {
  ValencyOnlineBankingPayment({
    super.key,
    required this.numberController,
    required this.bsbController,
    required this.accountNameController,
  });

  final TextEditingController numberController;          // The controller that can access the account number
  final TextEditingController bsbController;             // The controller that can access the account bsb number
  final TextEditingController accountNameController;     // The controller that can access the account holders name
  bool saveAccountInfo = true;                           // Whether or not to save the account info - false by default
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'To complete your online bank deposit, please click below to attach your bank account',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ValencyTextField(
                  controller: numberController,
                  hintText: "Account Number",
                  obscureText: false,
                  width: 550,
                ),
              ),
              SizedBox(width: 10),
              ValencyTextField(
                controller: bsbController,
                hintText: "BSB",
                obscureText: false,
                width: 215,
              ),
            ],
          ),
          SizedBox(height: 10),
          ValencyTextField(   // No need for width value as default ValencyTextField will take up entire width
            controller: accountNameController,
            hintText: "Name of Account Holder",
            obscureText: false,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Checkbox(
                value: saveAccountInfo,
                onChanged: (bool? value) {
                  saveAccountInfo = value ?? false;
                },
              ),
              Text(
                'Save Account Info',
                style: TextStyle(fontSize: 32),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ValencyDisplayOnlineBankingDetails extends StatelessWidget {
  const ValencyDisplayOnlineBankingDetails({
    super.key,
    required this.accountNumber,
    required this.bsb,
    required this.customerReference,
    required this.numberController,
    required this.bsbController,
    required this.accountNameController,
  });

  final String accountNumber;                           // Passthrough - Account Number (should show first and last 4 digits for security)
  final String bsb;                                     // Passthrough - Account BSB Number
  final String customerReference;                       // Passthrough - Valency Customer Reference Number for this account
  final TextEditingController numberController;         // If user wants to use a different account - The controller that can access the account number
  final TextEditingController bsbController;            // If user wants to use a different account - The controller that can access the accounts bsb number
  final TextEditingController accountNameController;    // If user wants to use a different account - The controller that can access the account holders name
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The funds will be sent to the following account:',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          
          SizedBox(height: 10),

          Text(
            'Account Number: $accountNumber',
            style: TextStyle(fontSize: 32),
          ),

          SizedBox(height: 2),

          Text(
            'BSB: $bsb',
            style: TextStyle(fontSize: 32),
          ),

          SizedBox(height: 2),

          Text(
            'Customer Reference: $customerReference',
            style: TextStyle(fontSize: 32),
          ),

          SizedBox(height: 20),

          ValencyTextButton(  
            onTap: () {       // When pressed, replace current widget with ValencyOnlineBanking widget and pass all the text field controllers
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ValencyOnlineBankingPayment(
                  numberController: numberController,
                  bsbController: bsbController,
                  accountNameController: accountNameController,
                  )
                ),
              );
            },
            buttonColor: Colors.blue,
            buttonText: 'Send funds to another account',
          ),
        ],
      ),
    );
  }
}