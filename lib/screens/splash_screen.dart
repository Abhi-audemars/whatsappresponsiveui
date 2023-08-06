import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsappresponsiveui/screens/landing_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void splash() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LandingScreen()),
          (route) => false);
    });
  }

  @override
  void initState() {
    super.initState();
    splash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Image.network(
              'https://androidkenya.com/wp-content/uploads/2020/01/WhatsApp_dark_mode.jpg'),
        ),
      ),
    );
  }
}
