//  import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:masrofy/core/constants.dart';
// import 'package:masrofy/core/routes.dart';

// class RegisterView extends StatelessWidget {
//   const RegisterView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final height = size.height;
//     final width = size.width;

//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: width * 0.06,
//               vertical: height * 0.02,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Back button
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white70,
//                     borderRadius: BorderRadius.circular(15),
//                   ),

//                   width: 45,
//                   height: 45,
//                   child: IconButton(
//                     onPressed: () {
//                       GoRouter.of(context).pop();
//                     },
//                     icon: const Icon(Icons.arrow_back_ios_new),
//                   ),
//                 ),

//                 SizedBox(height: height * 0.04),

//                 Text(
//                   'Create your\nAccount',
//                   style: TextStyle(
//                     fontSize: width * 0.07,
//                    fontWeight: FontWeight.w700,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: height * 0.04),

//                 // Full Name
//                 TextField(
//                   decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.person_outline),
//                     hintText: 'Full Name',
//                     hintStyle: TextStyle(color: kGreyFontColor),
//                     filled: true,
//                     fillColor: kGreyColor,
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: const BorderSide(
//                         color: Colors.black,
//                         width: 1.5,
//                       ),
//                     ),

//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide(
//                         color: Colors.grey.shade300,
//                         width: 1,
//                       ),
//                     ),

//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: height * 0.02),

//                 // Email
//                 TextField(
//                   decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.email_outlined),
//                     hintText: 'Enter Your Email',
//                     hintStyle: TextStyle(color: kGreyFontColor),
//                     filled: true,
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: const BorderSide(
//                         color: Colors.black,
//                         width: 1.5,
//                       ),
//                     ),

//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide(
//                         color: Colors.grey.shade300,
//                         width: 1,
//                       ),
//                     ),
//                     fillColor: kGreyColor,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: height * 0.02),

//                 // Password
//                 TextField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.lock_outline),
//                     hintText: 'Password',
//                     hintStyle: TextStyle(color: kGreyFontColor),
//                     suffixIcon: const Icon(Icons.visibility_off),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: const BorderSide(
//                         color: Colors.black,
//                         width: 1.5,
//                       ),
//                     ),

//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide(
//                         color: Colors.grey.shade300,
//                         width: 1,
//                       ),
//                     ),
//                     filled: true,
//                     fillColor: kGreyColor,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: height * 0.1),

//                 SizedBox(
//                   width: double.infinity,
//                   height: height * 0.065,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onPressed: () {

                      
//                     },
//                     child: Text(
//                       'Register',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: width * 0.045,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: height * 0.025),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Already Have An Account? ",
//                       style: TextStyle(color: kGreyFontColor),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         GoRouter.of(context).push(AppRoutes.kLoginView);
//                       },
//                       child: const Text(
//                         "Sign In",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: height * 0.05),

//                 // Continue with accounts
//                 const Center(
//                   child: Text(
//                     "Continue With Accounts",
//                     style: TextStyle(color: kGreyFontColor),
//                   ),
//                 ),
//                 SizedBox(height: height * 0.025),

//                 // Social buttons
//                 Row(
//                   children: [
//                     Expanded(
//                       child: SizedBox(
//                         height: height * 0.065,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Google login
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFFFFCDD2),
//                             foregroundColor: const Color(0xFFD32F2F),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             elevation: 0,
//                           ),
//                           child: Text(
//                             'GOOGLE',
//                             style: TextStyle(
//                               fontSize: width * 0.035,
//                               fontWeight: FontWeight.w600,
//                               letterSpacing: 1,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: width * 0.04),
//                     Expanded(
//                       child: SizedBox(
//                         height: height * 0.065,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Facebook login
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFFBBDEFB),
//                             foregroundColor: const Color(0xFF1976D2),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             elevation: 0,
//                           ),
//                           child: Text(
//                             'FACEBOOK',
//                             style: TextStyle(
//                               fontSize: width * 0.035,
//                               fontWeight: FontWeight.w600,
//                               letterSpacing: 1,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: height * 0.04),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
