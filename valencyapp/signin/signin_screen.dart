import 'package:flutter/material.dart'
import 'package:valencyapp/components/bigbutton.dart'
import 'package:valencyapp/components/textfield.dart'
import 'package:valencyapp/components/textbutton.dart'

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  // I/O Controllers
  final emailController = TextEditingController();      // Reads email
  final passwordController = TextEditingController();   // Reads password
  void signIn() {}                                      // Called when sign in button pressed
  void forgotPassword() {}                              // Called when forgot password button pressed
  void signUp() {}                                      // Called when sign up button pressed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: const[


              
              const FractionallySizedBox(widthFactor: 1, heightFactor: 0.4),   // Gap between top and content

              Text('Login', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 96
                ),
              ),
              Text('Please sign in to continue.', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 48
                ),
              ),

              const SizedBox(height: 20),   // Gap between Text and Text Fields

              ValencyTextField(    // Input Field - Email
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 20),   // Gap between text fields

              ValencyTextField(    // Input Field - Email
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),   // Gap between text fields and text

              ValencyTextButton(
                onTap: forgotPassword,
                buttonColor: Colors.blue,
                buttonText: 'Forgot Password?',
              ),

              const FractionallySizedBox(widthFactor: 1, heightFactor: 0.3),   // Gap Between top of screen and next element - 40% of screen height

              ValencyBigButton(   // Button - LOGIN
                onTap: signIn, 
                buttonColor: Colors.blue, 
                hintText: 'LOGIN',
              ),

              const SizedBox(height: 10),   // Gap between login button and sign up text

              ValencyTextButton(
                onTap: signUp,
                buttonColor: Colors.blue,
                buttonText: "Don't have an account? Sign up",
              ),



            ],
          ),
        ),
      ),
    );
  }
}