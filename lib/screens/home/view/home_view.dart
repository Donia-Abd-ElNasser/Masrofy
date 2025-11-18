import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:masrofy/core/routes.dart';
import 'package:masrofy/screens/Auth/view_model/auth_cubit/auth_cubit.dart';
import 'package:masrofy/screens/Auth/view_model/auth_cubit/auth_state.dart';
import 'package:masrofy/screens/home/view/widgets/pie_and_statistics.dart';
import 'package:masrofy/screens/home/view/widgets/smart_alert.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final authCubit = context.read<AuthCubit>();
            final user = authCubit.currentUser;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ---------------------- USER HEADER ----------------------
                  if (user != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  user.photoURL != null
                                      ? NetworkImage(user.photoURL!)
                                      : AssetImage("assets/images/profile.png")
                                          as ImageProvider,
                            ),

                            SizedBox(width: width * 0.03),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Welcome back!",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  user.displayName ?? "User",
                                  style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        IconButton(
                          onPressed:
                              () => context.push(AppRoutes.kNotificationView),
                          icon: Icon(
                            FontAwesomeIcons.solidBell,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        const Text(
                          "You are not logged in",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () => context.push(AppRoutes.kWelcomeView),
                          child: const Text("Login"),
                        ),
                      ],
                    ),

                  SizedBox(height: height * 0.03),

                  /// ---------------------- BALANCE CARD ----------------------
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(width * 0.048),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/balance.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Total Balance",
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "£3,000",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "from £20,000",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: 0.7,
                          color: Color(0xff329EC5),
                          backgroundColor: Colors.white24,
                          minHeight: 6,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  /// ---------------------- INCOME / OUTCOME ----------------------
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage('assets/images/Frame 14368.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: StatCard("Income", "£20,000", Colors.green),
                        ),
                        Container(width: 1, color: Colors.white),
                        Expanded(
                          child: StatCard("Outcome", "£17,000", Colors.red),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  /// ---------------------- SMART ALERTS ----------------------
                  SmartAlert(width: width),

                  SizedBox(height: height * 0.02),

                  /// ---------------------- PIE CHART ----------------------
                  PieAndStatistics(height: height),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget StatCard(String title, String value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          title == "Income"
              ? FontAwesomeIcons.arrowDown
              : FontAwesomeIcons.arrowUp,
          color: color,
          size: 25,
        ),
        SizedBox(width: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
