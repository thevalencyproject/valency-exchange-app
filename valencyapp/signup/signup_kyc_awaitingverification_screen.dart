import 'package:flutter/material.dart';

class SignUpAwaitingVerificationScreen extends StatelessWidget {
  SignUpAwaitingVerificationScreen({super.key});

  // I/O Controllers
  void goBack() {}   // Called when back button is pressed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: const[


              
              const FractionallySizedBox(widthFactor: 1, heightFactor: 0.33),  // Gap between top and content

              Text('Awaiting Verification', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 96
                ),
                textAlign: TextAlign.center,
              ),
              Text('We are waiting for our KYC providers systems to validate your identity.', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              Text('This can take anywhere from 1 minute to 2 hours. You can close the app in the meantime.', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 48
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 25),   // Gap text and terms of service

              Image.asset(
                "images/loading.gif",
                height: 250.0,
                width: 250.0,
              ),



            ],
          ),
        ),
      ),
    );
  }
}