import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masrofy/core/constants.dart';
import 'package:masrofy/core/routes.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).pushReplacement(AppRoutes.kOnBoardingView);
    });
  }

  @override

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          // This prevents overflow on smaller screens
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.25),
              Image.asset(
                'assets/images/logo.png',
                width: width * 0.6, // responsive logo size
              ),
              SizedBox(height: height * 0.12),
              Text(
                'Masrofy',
                style: TextStyle(
                  fontFamily: kPrimaryFont,
                  fontSize: width * 0.09, // scales with screen width
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                'Version 1.0',
                style: TextStyle(
                  fontFamily: kPrimaryFont,
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
