import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:masrofy/core/routes.dart';
import 'package:masrofy/core/utills/back_button.dart';
import 'package:masrofy/screens/Auth/view_model/auth_cubit/auth_cubit.dart';
import 'package:masrofy/screens/Auth/view_model/auth_cubit/auth_state.dart';

class VerifyPhoneView extends StatefulWidget {
  const VerifyPhoneView({super.key});

  @override
  State<VerifyPhoneView> createState() => _VerifyPhoneViewState();
}

class _VerifyPhoneViewState extends State<VerifyPhoneView> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errmessage),
                  backgroundColor: Colors.redAccent,
                ),
              );
            }
            if (state is AuthSuccess) {
              GoRouter.of(context).pushReplacement(AppRoutes.kHomeView);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.06,
                  vertical: height * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Backbutton(width: width),
                    SizedBox(height: height * 0.1),

                    Center(
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: height * 0.05,
                          horizontal: width * 0.05,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Verify Phone",
                              style: TextStyle(
                                fontSize: width * 0.06,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              "We have sent a code to your phone number",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: width * 0.035,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: height * 0.04),

                            /// OTP Fields
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(6, (index) {
                                return SizedBox(
                                  width: width * 0.1,
                                  height: width * 0.14,
                                  child: TextField(
                                    controller: _controllers[index],
                                    focusNode: _focusNodes[index],
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    maxLength: 1,
                                    style: TextStyle(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: InputDecoration(
                                      counterText: "",
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                          width: 1.5,
                                        ),
                                      ),
                                    ),
                                    onChanged:
                                        (value) => _onChanged(value, index),
                                  ),
                                );
                              }),
                            ),
                            SizedBox(height: height * 0.05),

                            /// Verify Button
                            SizedBox(
                              width: double.infinity,
                              height: height * 0.065,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed:
                                    state is AuthLoading
                                        ? null
                                        : () {
                                          final code =
                                              _controllers
                                                  .map((e) => e.text)
                                                  .join()
                                                  .trim();
                                          if (code.length == 6) {
                                            BlocProvider.of<AuthCubit>(
                                              context,
                                            ).verifyOtp(code);
                                          } else {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'Please enter the 6-digit code.',
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                child:
                                    state is AuthLoading
                                        ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                        : Text(
                                          "Verify",
                                          style: TextStyle(
                                            fontSize: width * 0.045,
                                            color: Colors.white,
                                          ),
                                        ),
                              ),
                            ),

                            SizedBox(height: height * 0.02),

                            /// Send Again Button
                            SizedBox(
                              width: double.infinity,
                              height: height * 0.065,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey.shade100,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed:
                                    state is AuthLoading
                                        ? null
                                        : () {
                                          for (var c in _controllers) {
                                            c.clear();
                                          }
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Verification code resent!',
                                              ),
                                            ),
                                          );
                                        },
                                child: Text(
                                  "Send Again",
                                  style: TextStyle(
                                    fontSize: width * 0.045,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
