import 'package:flutter/material.dart';
import 'package:valencyapp/components/textfield.dart';
import 'package:valencyapp/components/textbutton.dart';
import 'package:valencyapp/components/backbutton.dart';

class SignIn2FAScreen extends StatelessWidget {
  SignIn2FAScreen({super.key});

  // I/O Controllers
  final verificationCodeController = TextEditingController();   // Reads verification code
  void noPhoneAccess() {}                                       // Called when no phone access button is pressed
  void goBack() {}                                              // Called when back button is pressed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: const[


              
              const FractionallySizedBox(widthFactor: 1, heightFactor: 0.08),   // Gap top and content

              ValencyBackButton(
                onTap: goBack,
              ),

              const FractionallySizedBox(widthFactor: 1, heightFactor: 0.37),   // Gap back button and text

              Text('Login', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 96
                ),
              ),
              Text("We've just sent you a verification code via SMS", 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 48
                ),
              ),

              const SizedBox(height: 20),   // Gap between Text and Text Fields

              ValencyTextField(    // Input Field - Verification Code
                controller: verificationCodeController,
                hintText: 'Verification Code',
                obscureText: false,
              ),

              const SizedBox(height: 10),   // Gap between text fields and text

              ValencyTextButton(
                onTap: noPhoneAccess,
                buttonColor: Colors.blue,
                buttonText: "I don't have access to my phone anymore",
              ),



            ],
          ),
        ),
      ),
    );
  }
}