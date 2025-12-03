import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:masrofy/core/routes.dart';
import 'package:masrofy/screens/Auth/view_model/auth_cubit/auth_cubit.dart';
import 'package:masrofy/screens/Auth/view_model/auth_cubit/auth_state.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            GoRouter.of(context).pushReplacement(AppRoutes.kHomeView);
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errmessage)));
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.15),

                  Container(
                    width: width * 0.6,
                    height: width * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Image.asset('assets/images/logo.png')),
                  ),

                  SizedBox(height: height * 0.05),

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
                      // ---------------- GOOGLE BUTTON ----------------
                      Expanded(
                        child: SizedBox(
                          height: height * 0.065,
                          child: ElevatedButton(
                            onPressed:
                                state is AuthLoading
                                    ? null
                                    : () async {
                                      await BlocProvider.of<AuthCubit>(
                                        context,
                                      ).signInWithGoogle();
                                    },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                201,
                                198,
                                198,
                              ),
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: const BorderSide(
                                  color: Colors.black,
                                  width: 1.5,
                                ), // BORDER
                              ),
                              elevation: 0, // NO SHADOW
                              shadowColor: Colors.transparent, // NO SHADOW
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (state is AuthLoading)
                                   SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                      strokeWidth: 2,
                                    ),
                                  )
                                else ...[
                                  const Icon(
                                    FontAwesomeIcons.google,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'GOOGLE',
                                    style: TextStyle(
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: width * 0.04),

                      // ---------------- PHONE BUTTON ----------------
                      Expanded(
                        child: SizedBox(
                          height: height * 0.065,
                          child: ElevatedButton(
                            onPressed: () {
                              GoRouter.of(context).push(AppRoutes.kPhoneView);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                201,
                                198,
                                198,
                              ),
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: const BorderSide(
                                  color: Colors.black,
                                  width: 1.5,
                                ), // BORDER
                              ),
                              elevation: 0, // NO SHADOW
                              shadowColor: Colors.transparent, // NO SHADOW
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  FontAwesomeIcons.phone,
                                  color: Colors.black,
                                  size: 15,
                                ),
                                const SizedBox(width: 10),
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
          );
        },
      ),
    );
  }
}
