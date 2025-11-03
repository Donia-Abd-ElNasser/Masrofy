// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:masrofy/screens/home/view/widgets/legend_item.dart';
import 'package:masrofy/screens/home/view/widgets/pie_section.dart';

class PieAndStatistics extends StatelessWidget {
  const PieAndStatistics({
    Key? key,
    required this.height,
  }) : super(key: key);
final double height;
  @override
  Widget build(BuildContext context) {
    return  Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/images/Merchandise Category.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Merchandise Category",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "In last 10 days",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    SizedBox(height: height * 0.03),

                    // Pie Chart
                    SizedBox(
                      height: height * 0.28,
                      child: PieChart(
                        PieChartData(
                          centerSpaceRadius: 40,
                          sectionsSpace: 3,
                          sections: [
                            pieSection(46.3, Colors.orange),
                            pieSection(23.7, Colors.green),
                            pieSection(15.6, Colors.blue),
                            pieSection(8.6, Colors.purple),
                            pieSection(5.8, Colors.red),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.02),
                    LegendItem(
                      title: "Electronics",
                      percent: "46.3%",
                      color: Colors.orange,
                    ),
                    LegendItem(
                      title: "Supermarket purchases",
                      percent: "23.7%",
                      color: Colors.green,
                    ),
                    LegendItem(
                      title: "Installments",
                      percent: "15.6%",
                      color: Colors.blue,
                    ),
                    LegendItem(
                      title: "Restaurant lunch",
                      percent: "8.6%",
                      color: Colors.purple,
                    ),
                    LegendItem(
                      title: "Car fuel",
                      percent: "5.8%",
                      color: Colors.red,
                    ),
                  ],
                ),
              );
  }
}
