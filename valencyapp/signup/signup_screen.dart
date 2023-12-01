import 'package:flutter/material.dart'
import 'package:valencyapp/components/bigbutton.dart'
import 'package:valencyapp/components/textfield.dart'
import 'package:valencyapp/components/textbutton.dart'

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  // I/O Controllers
  final fullNameController = TextEditingController();   // Reads full name
  final phoneController = TextEditingController();      // Reads phone number
  final emailController = TextEditingController();      // Reads email
  final addressController = TextEditingController();    // Reads address
  final passwordController = TextEditingController();   // Reads password
  final confirmController = TextEditingController();    // Reads confirm password
  void signUp() {}                                      // Called when the sign up button is pressed
  void signIn() {}                                      // Called when the sign in button is pressed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: const[


              
              const FractionallySizedBox(widthFactor: 1, heightFactor: 0.3),  // Gap between top and content

              Text('Sign Up', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 96
                ),
              ),
              Text('Please ensure all details are up-to-date and correct', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 48
                ),
              ),

              const SizedBox(height: 20),   // Gap between Text and Text Fields

              ValencyTextField(
                controller: fullNameController,
                hintText: 'Full Name',
                obscureText: false,
              ),

              const SizedBox(height: 20),   // Gap between text fields

              ValencyTextField(
                controller: phoneController,
                hintText: 'Phone',
                obscureText: false,
              ),

              const SizedBox(height: 20),   // Gap between text fields

              ValencyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 20),   // Gap between text fields

              ValencyTextField(
                controller: addressController,
                hintText: 'Address',
                obscureText: false,
              ),

              const SizedBox(height: 20),   // Gap between text fields

              ValencyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 20),   // Gap between text fields

              ValencyTextField(
                controller: confirmController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),

              const SizedBox(height: 25),   // Gap between text fields and sign up button

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