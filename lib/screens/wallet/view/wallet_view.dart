import 'package:flutter/material.dart';
import 'package:masrofy/core/constants.dart';
import 'package:masrofy/core/utills/custom_app_bar.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
 
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: CustomAppBar(width: width, text: 'Wallet')
      ),
       body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height*0.015,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(width * 0.04),
              decoration: BoxDecoration(
               image: DecorationImage(image: AssetImage('assets/images/balance.jpg'),),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total monthly budget",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.035,
                    ),
                  ),
                  SizedBox(height: height * 0.005),
                  Text(
                    "£5,000",
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: height * 0.015),
                  LinearProgressIndicator(
                    value: 0.49, 
                    backgroundColor: Colors.grey.shade200,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xff329EC5),
                    ),
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Disbursed:\n £2,460",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.035,
                        ),
                      ),
                      Text(
                        "Residual:\n £2,530",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.035,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.01),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.shade400,width: 2))
              ),
              child: Text(
                "  Budgets by category",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: width * 0.035,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: height * 0.02),

            // 🍔 Food and drinks
            BudgetCategory(
               image: 'assets/images/Ellipse 194.png',
              width,
              height,
              color: const Color(0xFFFFB700),
              title: "Food and drinks",
              spent: 420,
              total: 500,
              icon: Icons.fastfood,
            ),

            SizedBox(height: height * 0.02),

          
            BudgetCategory(
               image: 'assets/images/Ellipse 194 (2).png',
              width,
              height,
              color: Colors.blueAccent,
              title: "Transportation",
              spent: 50,
              total: 100,
              icon: Icons.directions_car,
            ),

            SizedBox(height: height * 0.02),

          
            BudgetCategory(
              image: 'assets/images/Ellipse 194 (3).png',
              width,
              height,
              color: Color(0xffFF0000),
              title: "Shopping",
              spent: 780,
              total: 800,
              icon: Icons.shopping_bag,
            ),
          ],
        ),
      ),
     
    );
  }
}
Widget BudgetCategory(double width, double height,
      {required Color color,
      required String title,  required String image,
      required int spent,
      required int total,
      required IconData icon}) {
    final percent = spent / total;
    return Container(
      padding: EdgeInsets.all(width * 0.04),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(14),
        border: Border(right: BorderSide(color: color,width:4.5))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(image),
                child: Icon(icon, color: Colors.white, size: width * 0.07)),
              SizedBox(width: width * 0.03),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.035,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
          Row(
           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "£$total | ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.03,
                ),
              ),
              Text(
                "Disbursed: £$spent",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: width * 0.03,
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.008),
          LinearProgressIndicator(
            value: percent,
            backgroundColor: Colors.grey.shade700,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 4,
            borderRadius: BorderRadius.circular(10),
          ),
          SizedBox(height: height * 0.008),
          Text(
            "Remaining £${total - spent} in budget",
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: width * 0.02,
            ),
          ),
        ],
      ),
    );
  }
