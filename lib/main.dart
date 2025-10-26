// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const masroffi());
}

class masroffi extends StatelessWidget {
  const masroffi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'masroffi',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
