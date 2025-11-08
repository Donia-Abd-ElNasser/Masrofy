import 'package:flutter/material.dart';

import 'package:masrofy/core/constants.dart';
import 'package:masrofy/core/utills/custom_app_bar.dart';
import 'package:masrofy/screens/budget/view/widgets/budget_widget.dart';

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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.019),

            // 🔍 Search Bar
            TextField(
              cursorColor: Colors.black,
              cursorHeight: 18,
              style: const TextStyle(
                color: Color.fromARGB(255, 105, 19, 19),
                fontSize: 12,
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 22,
                ),
                hintText: 'Search for a transaction...',
                hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                filled: true,
                fillColor: kPrimaryColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(color: Colors.black, width: 1.5),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(color: Colors.black, width: 1.2),
                ),
              ),
            ),

            SizedBox(height: height * 0.005),

            // 🧾 Transactions
           BudgetWidget(height: height, width: width, date: "October 28, 2025", amount: "-£5,430", title: 'Supermarket purchases', place: "Al - Habib", icon:'assets/images/mdi_shopping.png' )
,BudgetWidget(height: height, width: width, date: "October 27, 2025", amount: '"-£420"', title: "Restaurant lunch", place: '"Hassanien"', icon: 'assets/images/mdi_food.png'),
BudgetWidget(height: height, width: width, date: "October 27, 2025", amount: '"-£1,200"', title: 'Car fuel', place: "ENI", icon: 'assets/images/roentgen_fuel-station.png'),


BudgetWidget(height: height, width: width, date: "October 28, 2025", amount: "-£5,430", title: "Supermarket purchases", place: "Al - Habib", icon: 'assets/images/mdi_shopping.png')
            
           , Container(
              width: double.infinity,
              height: height * 0.14,
              decoration: BoxDecoration(
                color: kDarkGrey,
                borderRadius: BorderRadius.circular(16),
                border:Border(right: BorderSide(color: Colors.redAccent,width: 3))),
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total expenses this week:",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.04,
                    ),
                  ),
                  SizedBox(height: height*0.009,)
                  ,Text(
                  " -£20,430",
                  style: TextStyle(
                    color: Color(0xffFF383C),
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.06,
                  ),
                ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
          ],
        ),
      ),
    );
  }
}
