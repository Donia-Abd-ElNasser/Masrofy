// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:masrofy/core/routes.dart';


// class ForgetPasswordView extends StatelessWidget {
//   const ForgetPasswordView({super.key});

//   @override
//   Widget build(BuildContext context) {
 
//     final size = MediaQuery.of(context).size;
//     final height = size.height;
//     final width = size.width;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF7F7F7),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(width * 0.05),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
              
//               IconButton(
//                 icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//                 onPressed: () {
//                    GoRouter.of(context).push(AppRoutes.kLoginView);
//                 },
//               ),
//               SizedBox(height: height * 0.02),

          
//               Container(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: width * 0.05,
//                   vertical: height * 0.04,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Forget Password",
//                       style: TextStyle(
//                         fontSize: width * 0.07,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     SizedBox(height: height * 0.01),

//                     Text(
//                       "Select which contact details should we use to reset your password",
//                       style: TextStyle(
//                         fontSize: width * 0.035,
//                         color: Colors.black54,
//                       ),
//                     ),
//                     SizedBox(height: height * 0.04),

//                     // 📨 اختيار الإيميل
//                     GestureDetector(
//                       onTap: () {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(builder: (context) => const EnterEmail()),
//                         // );
//                       },
//                       child: const OptionCard(
//                         icon: Icons.email_outlined,
//                         title: 'Email',
//                         subtitle: 'Code will be sent to your email',
//                       ),
//                     ),
//                     SizedBox(height: height * 0.02),

//                     // 📱 اختيار الهاتف
//                     GestureDetector(
//                       onTap: () {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(builder: (context) => const EnterPhoneNumberPage()),
//                         // );
//                       },
//                       child: const OptionCard(
//                         icon: Icons.phone_outlined,
//                         title: 'Phone',
//                         subtitle: 'Code will be sent to your phone',
//                       ),
//                     ),

//                     SizedBox(height: height * 0.06),

//                     // 🔘 زر Next
//                     SizedBox(
//                       width: double.infinity,
//                       height: height * 0.065,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.black87,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         onPressed: () {},
//                         child: Text(
//                           'Next',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: width * 0.045,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class OptionCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String subtitle;

//   const OptionCard({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.subtitle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;

//     return Container(
//       padding: EdgeInsets.all(width * 0.04),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade300, width: 2),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, size: width * 0.07, color: Colors.black87),
//           SizedBox(width: width * 0.04),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: width * 0.045,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 SizedBox(height: width * 0.01),
//                 Text(
//                   subtitle,
//                   style: TextStyle(
//                     fontSize: width * 0.035,
//                     color: Colors.grey.shade600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
