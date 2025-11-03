import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:masrofy/core/routes.dart';



class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      //backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          // To avoid overflow on small devices
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.15),

                // Logo
                Container(
                  width: width * 0.6,
                  height: width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),

                SizedBox(height: height * 0.05),

                // Welcome text
                Text(
                  'Welcome to',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: width * 0.09,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: height * 0.01),
                Text(
                  'Masrofy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: width * 0.1,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),

               SizedBox(height: height * 0.07),

              
          

                Text(
                  'Continue With ',
                  style: TextStyle(
                    fontSize: width * 0.035,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: height * 0.04),

                // Social buttons
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: height * 0.065,
                        child: ElevatedButton(
                          onPressed: () {
                         
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFCDD2),
                            foregroundColor: const Color(0xFFD32F2F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(FontAwesomeIcons.google,color: const Color(0xFFD32F2F),size: 15,),
                              
                               SizedBox(width: 10,),
                              Text(
                                'GOOGLE',
                                style: TextStyle(
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: width * 0.04),

                    Expanded(
                      child: SizedBox(
                        height: height * 0.065,
                        child: ElevatedButton(
                          onPressed: () {
                        GoRouter.of(context).push(AppRoutes.kPhoneView);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFBBDEFB),
                            foregroundColor: const Color(0xFF1976D2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Icon(FontAwesomeIcons.phone,color: const Color(0xFF1976D2),size: 15,),
                                SizedBox(width: 10,),
                              Text(
                                'PHONE',
                                style: TextStyle(
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * 0.06),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
