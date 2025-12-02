import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masrofy/core/constants.dart';
import 'package:masrofy/core/utills/custom_app_bar.dart';
import 'package:masrofy/screens/Auth/view_model/auth_cubit/auth_cubit.dart';
import 'package:masrofy/screens/Auth/view_model/auth_cubit/auth_state.dart';
import 'package:masrofy/screens/budget/view/widgets/budget_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BudgetView extends StatelessWidget {
  const BudgetView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: CustomAppBar(width: width, text: 'Budget'),
      ),

      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final authCubit = context.read<AuthCubit>();
          final user = authCubit.currentUser;

          if (user == null) {
            return const Center(
              child: Text(
                "Please login to view your budget",
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          final String userId = user.uid;

          return StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance
                    .collection("transactions")
                    .where("userId", isEqualTo: userId)
                    .orderBy("date", descending: true)
                    .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                );
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text(
                    "No transactions found.",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
              }

              final transactions = snapshot.data!.docs;

              // ----------------------------------------------------
              // 🔥 احسب إجمالي المصاريف هنا
              // ----------------------------------------------------
              double totalExpenses = 0;
              double totalIncome = 0;

              for (var doc in transactions) {
                final data = doc.data() as Map<String, dynamic>;
                if (data["transactionType"] == "expense") {
                  totalExpenses += (data["amount"] ?? 0).toDouble();
                }
              }

              for (var doc in transactions) {
                final data = doc.data() as Map<String, dynamic>;
                if (data["transactionType"] == "income") {
                  totalIncome += (data["amount"] ?? 0).toDouble();
                }
              }
              // ----------------------------------------------------

              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.019),

                    // SEARCH BAR
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Search for a transaction...",
                        filled: true,
                        fillColor: kPrimaryColor,
                        suffixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.01),

                    // -----------------------------------------------------------------
                    // 🔥 LIST OF TRANSACTIONS
                    // -----------------------------------------------------------------
      
                   
                   
                    for (var doc in transactions)
                      Builder(
                        builder: (context) {
                          final data = doc.data() as Map<String, dynamic>;

                          final String title = data["category"];
                          final String place = data["description"];
                          final double amount = data["amount"];
                          final int dateMs = data["date"];
                          final type = data['transactionType'];
                          final date = DateTime.fromMillisecondsSinceEpoch(
                            dateMs,
                          );

                          String iconPath = 'assets/images/mdi_shopping.png';
                          if (title.contains("Restaurant") ||
                              title.contains("Food")) {
                            iconPath = 'assets/images/mdi_food.png';
                          } else if (title.contains("fuel") ||
                              title.contains("Car")) {
                            iconPath =
                                'assets/images/roentgen_fuel-station.png';
                          }
                          return BudgetWidget(
                            type: type,
                            height: height,
                            width: width,
                            date: "${date.day}/${date.month}/${date.year}",
                            amount:
                                type == 'expense' ? "-£$amount" : "+£$amount",
                            title: title,
                            place: place,
                            icon: iconPath,
                          );
                        },
                      ),

                    SizedBox(height: height * 0.02),

                    // --------------------------------------------------------
                    // 🔥 TOTAL EXPENSES CARD (SHOWN CORRECTLY NOW)
                    // --------------------------------------------------------
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          color: kDarkGrey,
                          border: Border(
                            left: BorderSide(color: Colors.redAccent, width: 3),
                            right: BorderSide(
                              color: Color.fromARGB(255, 39, 135, 66),
                              width: 3,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // --- expense ---
                            Column(
                              children: [
                                Text(
                                  "Total expenses:",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.04,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "-£${totalExpenses.toStringAsFixed(2)}",
                                  style: TextStyle(
                                    color: Color(0xffFF383C),
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.05,
                                  ),
                                ),
                              ],
                            ),

                            // Divider
                            SizedBox(
                              height: 60,
                              child: VerticalDivider(
                                color: Colors.white,
                                thickness: 1,
                              ),
                            ),

                            // --- income ---
                            Column(
                              children: [
                                Text(
                                  "Total income:",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.04,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "+£${totalIncome.toStringAsFixed(2)}",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 39, 135, 66),
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.05,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.02),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
