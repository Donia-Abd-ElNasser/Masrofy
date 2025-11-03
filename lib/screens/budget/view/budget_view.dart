import 'package:flutter/material.dart';
import 'package:masrofy/core/constants.dart';
import 'package:masrofy/core/utills/custom_app_bar.dart';

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
        title: CustomAppBar(width: width, text: 'Budget')
      ),
    );
  }
}