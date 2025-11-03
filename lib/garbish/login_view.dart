// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:masrofy/core/constants.dart';
// import 'package:masrofy/core/routes.dart';


// class LoginView extends StatelessWidget {
//   LoginView({super.key});

//   final ValueNotifier<bool> _obscurePassword = ValueNotifier(true);

//   @override
//   Widget build(BuildContext context) {
 
//     final size = MediaQuery.of(context).size;
//     final height = size.height;
//     final width = size.width;

//     return Scaffold(
     
//       body: SafeArea(
//         child: SingleChildScrollView(
//           keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//           padding: EdgeInsets.symmetric(
//             horizontal: width * 0.06,
//             vertical: height * 0.03,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//                Container(
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
//               SizedBox(height: height * 0.04),

//               Text(
//                 "Login Your\nAccount",
//                 style: TextStyle(
//                   fontSize: width * 0.07,
//                  fontWeight: FontWeight.w700,
//                     color: Colors.black,
//                 ),
//               ),
//               SizedBox(height: height * 0.15),

//               TextField(
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   prefixIcon: const Icon(Icons.email_outlined),
//                   hintText: "Enter Your Email",
//                   filled: true,
//                    hintStyle: TextStyle(color: kGreyFontColor),
//                   fillColor: Colors.grey.shade100,
//                   focusedBorder: OutlineInputBorder(
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
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(14),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               SizedBox(height: height * 0.025),

//               ValueListenableBuilder(
//                 valueListenable: _obscurePassword,
//                 builder: (context, obscure, _) {
//                   return TextField(
//                     obscureText: obscure,
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.lock_outline),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           obscure
//                               ? Icons.visibility_off_outlined
//                               : Icons.visibility_outlined,
//                         ),
//                         onPressed: () =>
//                             _obscurePassword.value = !_obscurePassword.value,
//                       ),
//                       hintText: "Password",
//                       hintStyle: TextStyle(color: kGreyFontColor),
//                       filled: true,
//                       focusedBorder: OutlineInputBorder(
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
//                       fillColor: Colors.grey.shade100,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(14),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   );
//                 },
//               ),

//              SizedBox(height: height * 0.015),

//               // Align(
//               //   alignment: Alignment.centerRight,
//               //   child: TextButton(
//               //     onPressed: () {
//               //       GoRouter.of(context).push('/forgot_password');
//               //     },
//               //     child: const Text(
//               //       "Forgot Password ?",
//               //       style: TextStyle(
//               //         color: Colors.black54,
//               //         fontWeight: FontWeight.w500,
//               //       ),
//               //     ),
//               //   ),
//               // ),

//               SizedBox(height: height * 0.015),

//               SizedBox(
//                 width: double.infinity,
//                 height: height * 0.065,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   onPressed: () {},
//                   child: Text(
//                     "Login",
//                     style: TextStyle(
//                       fontSize: width * 0.045,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),

//               SizedBox(height: height * 0.03),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Create New Account? ",style: TextStyle(color: kGreyFontColor)),
//                   GestureDetector(
//                     onTap: () {
//                      GoRouter.of(context).push(AppRoutes.kRegisterView);
//                     },
//                     child: const Text(
//                       "Sign up",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               SizedBox(height: height * 0.05),

//               const Center(
//                 child: Text(
//                   "Continue With Accounts",
//                   style: TextStyle(color: Colors.grey),
//                 ),
//               ),

//               SizedBox(height: height * 0.03),

//               Row(
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
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
