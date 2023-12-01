import 'package:flutter/material.dart'
import 'package:valencyapp/components/bigbutton.dart'
import 'package:valencyapp/components/textfield.dart'
import 'package:valencyapp/components/textbutton.dart'

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  // Email and Password Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  
  void signIn() {}            // Sign in method
  void forgotPassword() {}    // Forgot Password Method
  void signUp() {}            // Sign un method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: const[


              
              const FractionallySizedBox(widthFactor: 1, heightFactor: 0.4),   // Gap Between top of screen and next element - 40% of screen height

              Text('Login', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 96),),       // Title Text - Login
              Text('Please sign in to continue.', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 48),),       // Small Text - Please sign in to continue.

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
                hintText: 'Login'
              ),

              const SizedBox(height: 10),   // Gap between login button and sign up text

              ValencyTextButton(
                onTap: signUp,
                buttonColor: Colors.blue,
                buttonText: "Don't have an account? Sign up".
              ),



            ],
          ),
        ),
      ),
    );
  }
}