import 'package:flutter/material.dart';
import 'package:whatsappresponsiveui/colors/colors.dart';
import 'package:whatsappresponsiveui/responsive/responsive_layout.dart';
import 'package:whatsappresponsiveui/screens/mobile_screen_layout.dart';
import 'package:whatsappresponsiveui/screens/web_screen_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor:backgroundColor ,
       
        primarySwatch: Colors.blue,
      ),
      home:
      const ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ),
    );
  }
}
