// Title Text - Terms of Service
// Small Text - You must read and agree to the terms of service to use our exchange
// Button - Back Icon (to go back to signup_screen)

// Input Field - Full Name
// Input Field - Phone Number
// Input Field - Email
// Input Field - Address
// Input Field - Password
// Input Field - Confirm Pasword

// Display Field - Shows the terms of service (connected to database to update whenever TOS updates)

// Button - Disagree
// Button - Agree

import 'package:flutter/material.dart'
import 'package:valencyapp/components/bigbutton.dart'
import 'package:valencyapp/components/backbutton.dart'

class SignUpTOSScreen extends StatelessWidget {
  SignUpTOSScreen({super.key});

  // I/O Controllers
  void agree() {}      // Called when the agree button is pressed
  void disagree() {}   // Called when the disagree button is pressed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: const[


              
              const FractionallySizedBox(widthFactor: 1, heightFactor: 0.08),  // Gap between top and content

              ValencyBackButton(
                onTap: goBack,
              ),

              Text('Terms of Service', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 96
                ),
              ),
              Text('You must read and agree to the terms of service to use our exchange', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 48
                ),
              ),

              const SizedBox(height: 10),   // Gap text and terms of service

              ValencyTOS(),

              const SizedBox(height: 25),   // Gap between terms of service and buttons

              ValencyBigButton(
                onTap: disagree, 
                buttonColor: Colors.grey, 
                hintText: 'DISAGREE'
              ),

              const SizedBox(height: 10),   // Gap between buttons

              ValencyBigButton(
                onTap: agree, 
                buttonColor: Colors.blue, 
                hintText: 'AGREE'
              ),



            ],
          ),
        ),
      ),
    );
  }
}