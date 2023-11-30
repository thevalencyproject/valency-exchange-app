import 'package:flutter/material.dart'
import 'package:valencyapp/components/bigbutton.dart'
import 'package:valencyapp/components/textfield.dart'
import 'package:valencyapp/components/textbutton.dart'

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final verificationCodeController = TextEditingController();   // Used to read the input in verification code field
  void noPhoneAccess() {}                                       // No Phone access method
  void goBack() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: const[


              
              const FractionallySizedBox(widthFactor: 1, heightFactor: 0.08),   // Gap Between top of screen and next element - 8% of screen height

              ValencyBackButton(
                onTap: goBack,
              ),

              Text('Login', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 96),),       // Title Text - Login
              Text("We've just sent you a verification code via SMS", 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 48),),       // Small Text - We've just sent you a verification code via SMS.

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

// Button - Back Icon (to go back to signup_tos_screen)

// Title Text - Login
// Small Text - We've just sent you a verification code via SMS

// Input Field - Verification Code

// Button (looks like text) - I don't have access to my phone anymore