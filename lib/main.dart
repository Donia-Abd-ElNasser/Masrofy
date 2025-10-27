import 'package:flutter/material.dart';
import 'package:masrofy/core/constants.dart';
import 'package:masrofy/core/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.getRouter(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
        fontFamily: kPrimaryFont,
      ),
    );
  }
}
