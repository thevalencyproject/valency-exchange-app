import 'package:flutter/material.dart'

class NoInternetScreen extends StatelessWidget {
  NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: Column(
            children: const[


              
              const FractionallySizedBox(widthFactor: 1, heightFactor: 0.33),  // Gap between top and content

              Image.asset(alignment: ,
                "images/nointernet.svg",
                height: 252,
                width: 252,
              ),

              const SizedBox(height: 25),   // Gap text and terms of service

              Text('No Internet Connection', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 96
                ),
                textAlign: TextAlign.center,
              ),
              
              

            ],
          ),
        ),
      ),
    );
  }
}