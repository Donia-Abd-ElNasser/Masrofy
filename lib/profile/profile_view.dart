// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:masrofy/core/constants.dart';
// import 'package:masrofy/core/routes.dart';
// import 'package:masrofy/core/utills/custom_app_bar.dart';

// class ProfileView extends StatelessWidget {
//   const ProfileView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;

//     return Scaffold(

//       appBar:AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: kPrimaryColor,
//         elevation: 0,
//         title: CustomAppBar(width: width, text: 'Profile'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.02),
//         child: Column(
//           children: [
//             // 🧑 Profile Card
//             Container(
//               padding: EdgeInsets.all(width * 0.04),
//               decoration: BoxDecoration(
//                 color: const Color(0xFF1E1E1E),
//                 borderRadius: BorderRadius.circular(16),
//                 border: Border(right: BorderSide(color: Color(0xff123FB1),width: 5)),
//               ),
//               child: Row(
//                 children: [

//                   CircleAvatar(
//                     radius: width * 0.08,
//                     backgroundImage: const AssetImage('assets/images/profile.png'),
//                   ),
//                   SizedBox(width: width * 0.04),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Ahmed",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: width * 0.045,
//                           ),
//                         ),
//                         // Text(
//                         //   "AhmedAkoush@Mail.Com",
//                         //   style: TextStyle(
//                         //     color: Colors.grey.shade400,
//                         //     fontSize: width * 0.035,
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {

//                     },
//                     icon: const Icon(Icons.edit, color: Colors.white),
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(height: height * 0.03),

//             _buildOptionTile(
//               icon: Icons.help_outline,
//               title: "Assistant and guidance",
//               onTap: () {},
//             ),
//             _buildOptionTile(
//               icon: Icons.info_outline,
//               title: "About the app",
//               onTap: () {},
//             ),
//             _buildOptionTile(
//               icon: Icons.star_border,
//               title: "Rate the app",
//               onTap: () {},
//             ),

//             SizedBox(height: height * 0.01),

//             _buildOptionTile(
//               icon: Icons.logout,
//               title: "Log out",
//               onTap: () {
//                GoRouter.of(context).push(AppRoutes.kWelcomeView);
//               },
//               color: Colors.redAccent,
//               iconColor: Colors.redAccent,
//             ),
//           ],
//         ),
//       ),

//     );
//   }

//   Widget _buildOptionTile({
//     required IconData icon,
//     required String title,
//     required VoidCallback onTap,
//     Color? color,
//     Color? iconColor,
//   }) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 10),
//       decoration: BoxDecoration(
//         color: kDarkGrey,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: ListTile(
//         leading: Icon(icon, color: iconColor ?? Colors.white),
//         title: Text(
//           title,
//           style: TextStyle(
//             color: color ?? Colors.white,
//             fontWeight: FontWeight.w500,
//             fontSize: 14
//           ),
//         ),
//         trailing:  Icon(Icons.arrow_forward_ios, size: 14, color: color),
//         onTap: onTap,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:masrofy/core/constants.dart';
import 'package:masrofy/core/routes.dart';
import 'package:masrofy/core/utills/custom_app_bar.dart';
import 'package:masrofy/screens/Auth/view_model/auth_cubit/auth_cubit.dart';
import 'package:masrofy/screens/Auth/view_model/auth_cubit/auth_state.dart';
import 'package:masrofy/screens/about_app.dart';
import 'package:masrofy/screens/assistance.dart';
import 'package:masrofy/screens/rate_app.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: CustomAppBar(width: width, text: 'Profile'),
      ),

      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final user = context.read<AuthCubit>().currentUser;

          // --------------------------------------
          // 🔴 المستخدم غير مسجل دخول
          // --------------------------------------
          if (user == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_off, size: 100, color: Colors.grey),
                  const SizedBox(height: 15),
                  const Text(
                    "You're not logged in",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRoutes.kWelcomeView);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 14,
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          }

          // --------------------------------------
          // 🟢 المستخدم مسجل دخول — عرض البروفايل
          // --------------------------------------
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.02,
            ),
            child: Column(
              children: [
                // 🧑 Profile Card
                Container(
                  padding: EdgeInsets.all(width * 0.04),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(16),
                    border: Border(
                      right: BorderSide(color: Color(0xff123FB1), width: 5),
                    ),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: width * 0.08,
                        backgroundImage:
                            user.photoURL != null
                                ? NetworkImage(user.photoURL!)
                                : const AssetImage('assets/images/profile.png')
                                    as ImageProvider,
                      ),
                      SizedBox(width: width * 0.04),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.displayName ?? "User",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.045,
                              ),
                            ),
                            if (user.email != null)
                              Text(
                                user.email!,
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: width * 0.034,
                                ),
                              ),
                          ],
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.03),

                _buildOptionTile(
                  icon: Icons.help_outline,
                  title: "Assistant and guidance",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AssistanceScreen(),
                      ),
                    );
                  },
                ),

                _buildOptionTile(
                  icon: Icons.info_outline,
                  title: "About the app",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutAppScreen()),
                    );
                  },
                ),

                _buildOptionTile(
                  icon: Icons.star_border,
                  title: "Rate the app",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RateAppScreen()),
                    );
                  },
                ),

                SizedBox(height: height * 0.01),

                // ---------------- LOGOUT ----------------
                _buildOptionTile(
                  icon: Icons.logout,
                  title: "Log out",
                  color: Colors.redAccent,
                  iconColor: Colors.redAccent,
                  onTap: () async {
                    await context.read<AuthCubit>().signOut();
                    GoRouter.of(context).push(AppRoutes.kWelcomeView);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
    Color? iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: kDarkGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor ?? Colors.white),
        title: Text(
          title,
          style: TextStyle(
            color: color ?? Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 14, color: color),
        onTap: onTap,
      ),
    );
  }
}
