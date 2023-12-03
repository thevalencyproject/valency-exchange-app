import 'package:flutter/material.dart'
import 'package:valencyapp/components/backbutton.dart'
import 'package:valencyapp/components/kyccamera.dart'

class SignUpKYCLicenseFrontScreen extends StatelessWidget {
  SignUpKYCLicenseFrontScreen({super.key});

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


              
              const FractionallySizedBox(widthFactor: 1, heightFactor: 0.08),  // Gap between top and content

              ValencyBackButton(
                onTap: goBack,
              ),

              Text('Know Your Customer', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 96
                ),
              ),
              Text('Take a photo of the FRONT of your license or identification.', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text('Ensure the photo is clear and ID is visible.', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 48
                ),
              ),

              const SizedBox(height: 10),   // Gap text and terms of service

              ValencyKYCCamera(   // Displays the KYC camera - set to take front license photo
                photoType: 0,     // 0 = Front Licence, 1 = Back License, 2 = Face Photo
              ),



            ],
          ),
        ),
      ),
    );
  }
}