import 'package:flutter/material.dart'
import 'package:valencyapp/components/bigbutton.dart'
import 'package:valencyapp/components/textbutton.dart'

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  // I/O Controllers
  void signUp() {}   // Called when sign up button is pressed
  void signIn() {}   // Called when sign up button is pressed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: const[


              
              const FractionallySizedBox(widthFactor: 1, heightFactor: 0.31),  // Gap between top and content

              Text('Welcome to Valency', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 96
                ),
                textAlign: TextAlign.center,
              ),
              Text('The only exchange engineered to put security first.', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 48
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 35),   // Gap text and terms of service

              ValencyBigButton(
                onTap: signUp, 
                buttonColor: Colors.blue, 
                hintText: 'SIGN UP'
              ),

              const SizedBox(height: 10),   // Gap between button and sign in text

              ValencyTextButton(
                onTap: signIn,
                buttonColor: Colors.blue,
                buttonText: "Already have an account? Sign in",
              ),



            ],
          ),
        ),
      ),
    );
  }
}