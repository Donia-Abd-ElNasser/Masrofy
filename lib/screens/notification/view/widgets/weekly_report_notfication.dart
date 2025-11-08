import 'package:flutter/material.dart';
import 'package:masrofy/core/constants.dart';

class WeeklyReport extends StatelessWidget {
  const WeeklyReport({super.key, required this.width, required this.height, required this.subtitle, required this.time});
final double width;
final double height;
final String subtitle;
final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
              //  margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(width * 0.04),
                decoration: BoxDecoration(
                  color: kDarkGrey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Ellipse 194 (2).png'),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        'assets/images/akar-icons_info-fill.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    SizedBox(width: width * 0.04),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Weekly report",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(height: height * 0.005),
                          Text(
                           subtitle,
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(height: height * 0.008),
                          Text(
                            time,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
  }
}