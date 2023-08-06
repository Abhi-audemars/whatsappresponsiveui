import 'package:flutter/material.dart';
import 'package:whatsappresponsiveui/colors/colors.dart';
import 'package:whatsappresponsiveui/screens/mobile_screen_layout.dart';
import 'package:whatsappresponsiveui/widgets/custom_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Welcome to WhatsApp',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            SizedBox(height: size.height / 9),
            Image.asset(
              'assets/bg.png',
              height: 340,
              width: 340,
              color: tabColor,
            ),
            SizedBox(height: size.height / 9),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: size.width * 0.75,
              child: CustomButton(
                text: 'AGREE AND CONTINUE',
                onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MobileScreenLayout()),
                    (route) => false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
