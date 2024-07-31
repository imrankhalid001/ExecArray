import 'dart:async';

import 'package:exec_array/ui/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
    super.initState();
    // Navigate to HomeScreen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context)=> 
        const LoginScreen()
        )
        );
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Expanded widget to center the text vertically
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "ExecArray",
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const Text(
                    'Event Management',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            // Image at the bottom of the screen
            // Using a SizedBox to set the size of the image
          SizedBox(
            height: 450, // Adjust the height as needed
            child: Image.asset('assets/splash_bottom.jpg'),
          ),
          ],
        ),
      ),
    );
  }
}
