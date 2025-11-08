import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masrofy/core/constants.dart';

class BudgetWidget extends StatelessWidget {
  const BudgetWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.date,
    required this.amount,
    required this.title,
    required this.place,
    required this.icon,
  }) : super(key: key);

  final double width;
  final double height;
  final String date, amount, title, place;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.001),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                backgroundColor: const Color(0xFF1E1E1E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  width: width * 0.85,
                  padding: EdgeInsets.all(width * 0.05),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Amount",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: width * 0.04,
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.005),
                      Center(
                        child: Text(
                          "-£5,430",
                          style: TextStyle(
                            color: Color(0xffFF0005),
                            fontSize: width * 0.07,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      RowDetails("Category", "Shopping", width),
                      RowDetails("Description",
                          "Purchases from Habib Supermarket", width),
                      RowDetails(
                          "Date and Time", "October 28, 2025 - 2:30 PM", width),
                      RowDetails("Location", "Al - Habib, Qena", width),
                      SizedBox(height: height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                               
                              },
                              icon: const Icon(FontAwesomeIcons.edit, color: Colors.white),
                              label: const Text("Edit",style: TextStyle(color: Colors.white),),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFB38E2F),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.018),
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.04),
                         
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                                
                              },
                              icon:
                                  const Icon(Icons.close, color: Colors.white),
                              label: const Text("Delete",style: TextStyle(color: Colors.white),),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff5A1012),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.018),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Container(
          padding: EdgeInsets.all(width * 0.04),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(16),
            border: const Border(
              bottom: BorderSide(width: 1.5, color: Colors.grey),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: width * 0.032,
                ),
              ),
              SizedBox(height: height * 0.008),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: width * 0.1,
                        height: width * 0.1,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image:
                                AssetImage('assets/images/Ellipse 194 (3).png'),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          icon,
                          width: 28,
                          height: 28,
                        ),
                      ),
                      SizedBox(width: width * 0.04),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            place,
                            style: TextStyle(fontSize: width * 0.032),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    amount,
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.04,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget RowDetails(String title, String value, double width) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title:",
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: width * 0.035,
            ),
          ),
          SizedBox(width: width * 0.05),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.035,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
