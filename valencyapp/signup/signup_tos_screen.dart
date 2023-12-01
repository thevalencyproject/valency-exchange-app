import 'package:flutter/material.dart'
import 'package:valencyapp/components/bigbutton.dart'
import 'package:valencyapp/components/backbutton.dart'
import 'package:valencyapp/components/termsofservice.dart'

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

              ValencyTOS(),                 // Displays the terms of service

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