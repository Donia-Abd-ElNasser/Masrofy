import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:masrofy/core/constants.dart';
import 'package:masrofy/core/routes.dart';
import 'package:masrofy/screens/Auth/view_model/auth_cubit/auth_cubit.dart';
import 'package:masrofy/screens/Auth/view_model/auth_cubit/auth_state.dart';
import 'package:masrofy/screens/home/view/widgets/out_pie_and_statistics.dart';
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

                  SizedBox(height: height * 0.015),

                  /// ---------------------- BALANCE CARD ----------------------
                  /// ---------------------- REAL-TIME BALANCE ----------------------
                  if (user != null)
                    StreamBuilder(
                      stream:
                          FirebaseFirestore.instance
                              .collection("transactions")
                              .where("userId", isEqualTo: user.uid)
                              .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator(color: Colors.black,));
                        }

                        double totalIncome = 0;
                        double totalOutcome = 0;

                        for (var doc in snapshot.data!.docs) {
                          final data = doc.data();
                          final amount = (data["amount"] ?? 0).toDouble();

                          if (data["transactionType"] == "income") {
                            totalIncome += amount;
                          } else {
                            totalOutcome += amount;
                          }
                        }

                        double balance = totalIncome - totalOutcome;

                        return Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(width * 0.038),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/balance.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Total Balance",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "£${balance.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "From: £${totalIncome.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 8),
                              LinearProgressIndicator(
                                value:
                                    totalIncome == 0
                                        ? 0
                                        : (balance / totalIncome).clamp(0, 1),
                                color: const Color.fromARGB(255, 134, 88, 72),
                                backgroundColor: Colors.white24,
                                minHeight: 6,
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  else
                    SizedBox(),

                  SizedBox(height: height * 0.012),

                  /// ---------------------- INCOME / OUTCOME ----------------------
                  /// ---------------------- TOTAL INCOME / OUTCOME REAL-TIME ----------------------
                  if (user != null)
                    StreamBuilder(
                      stream:
                          FirebaseFirestore.instance
                              .collection("transactions")
                              .where("userId", isEqualTo: user.uid)
                              .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator(color: Colors.black,));
                        }

                        double totalIncome = 0;
                        double totalOutcome = 0;

                        for (var doc in snapshot.data!.docs) {
                          final data = doc.data();
                          final amount = (data["amount"] ?? 0).toDouble();

                          if (data["transactionType"] == "income") {
                            totalIncome += amount;
                          } else {
                            totalOutcome += amount;
                          }
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Card
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border(
                                  right: BorderSide(
                                    color: kGreyFontColor,
                                    width: 4,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: StatCard(
                                      "Income",
                                      "£${totalIncome.toStringAsFixed(2)}",
                                      Colors.green,
                                    ),
                                  ),
                                  const VerticalDivider(
                                    color: Colors.white,
                                    thickness: 1,
                                    endIndent: 20,
                                    indent: 20,
                                  ),
                                  Expanded(
                                    child: StatCard(
                                      "Outcome",
                                      "£${totalOutcome.toStringAsFixed(2)}",
                                      Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  else
                    SizedBox(),

                  SizedBox(height: height * 0.012),

                  /// ---------------------- SMART ALERTS ----------------------
                  SmartAlert(width: width),

                  SizedBox(height: height * 0.02),

                  /// ---------------------- PIE CHART ----------------------
                  /// ---------------------- PIE CHART ----------------------
                  if (user != null)
                    OutcomePieAndStatistics(height: height, userId: user.uid)
                  else
                    Center(
                      child: Text(
                        "Login to view statistics",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
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
