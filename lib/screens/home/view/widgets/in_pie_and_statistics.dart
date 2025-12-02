
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masrofy/screens/home/view/widgets/legend_item.dart';
import 'package:masrofy/screens/home/view/widgets/pie_section.dart';
import 'package:masrofy/screens/transaction/model.dart';
import 'package:masrofy/screens/transaction/view_model/cubit.dart';

class IncomePieAndStatistics extends StatelessWidget {
  final double height;
  final String userId;

  const IncomePieAndStatistics({
    super.key,
    required this.height,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TransactionModel>>(
      stream: context.read<TransactionCubit>().getTransactions(userId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return _loadingUI();
        }

        final transactions = snapshot.data!;

        if (transactions.isEmpty) {
          return _emptyUI();
        }

        return _buildChartUI(transactions);
      },
    );
  }

  Widget _loadingUI() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Center(child: CircularProgressIndicator(color: Colors.white)),
    );
  }

  Widget _emptyUI() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(
        "No transactions found",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  Widget _buildChartUI(List<TransactionModel> transactions) {
    /// 1️⃣ Filter ONLY expense
    final incomes = transactions.where((t) => t.transactionType == "income");

    /// 2️⃣ Sum total
    double total = incomes.fold(0, (sum, t) => sum + t.amount);

    if (total == 0) {
      return _emptyUI();
    }

    /// 3️⃣ Category sums
    Map<String, double> sums = {};
    for (var t in incomes) {
      sums[t.category] = (sums[t.category] ?? 0) + t.amount;
    }

    /// 4️⃣ Ratios
    Map<String, double> ratios = {};
    sums.forEach((cat, amount) {
      ratios[cat] = (amount / total) * 100;
    });

    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage('assets/images/Merchandise Category.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Incomes Categories",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "In last 10 days",
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),

          SizedBox(height: height * 0.03),

          /// PIE CHART
          SizedBox(
            height: height * 0.28,
            child: PieChart(
              PieChartData(
                centerSpaceRadius: 40,
                sectionsSpace: 3,
                sections:
                    ratios.entries.map((e) {
                      return pieSection(
                        e.value, // percent
                        CategoryColors.getColor(e.key), // color
                      );
                    }).toList(),
              ),
            ),
          ),

          SizedBox(height: height * 0.02),

          /// LEGEND
          ...ratios.entries.map((e) {
            return LegendItem(
              title: e.key,
              percent: "${e.value.toStringAsFixed(1)}%",
              color: CategoryColors.getColor(e.key),
            );
          }).toList(),
        ],
      ),
    );
  }
}

class CategoryColors {
  static const Map<String, Color> colors = {
    "Electronics": Colors.orange,
    "Supermarket purchases": Colors.green,
    "Installments": Colors.blue,
    "Restaurant lunch": Colors.purple,
    "Car fuel": Colors.red,
    "Food": Colors.brown,
    "Transport": Colors.teal,
    "Shopping": Colors.pink,
    "Bills": Colors.indigo,
    "Other": Colors.grey,
    "Extra Work":Colors.amberAccent,
    "Monthly income":Colors.lightGreenAccent
  };

  static Color getColor(String cat) => colors[cat] ?? Colors.grey;
}
