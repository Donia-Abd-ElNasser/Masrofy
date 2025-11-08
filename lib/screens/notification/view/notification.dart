import 'package:flutter/material.dart';
import 'package:masrofy/core/constants.dart';
import 'package:masrofy/core/utills/custom_app_bar.dart';
import 'package:masrofy/screens/notification/view/widgets/achieved_goal.dart';
import 'package:masrofy/screens/notification/view/widgets/budget_warning.dart';
import 'package:masrofy/screens/notification/view/widgets/weekly_report_notfication.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: CustomAppBar(width: width, text: 'Notifications'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
          //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: height*0.015,),
              BudgetWarning(
                width: width,
                height: height,
                subtitle: "You’ve spent 90% of your food and drinks budget.",
                time: "1 hour ago",
              ), SizedBox(height: height*0.015,),
              AchievedGoal(
                width: width,
                height: height,
                subtitle: "Your new savings goal has been achieved!",
                time: "2 days ago",
              ), SizedBox(height: height*0.015,),
              WeeklyReport(
                width: width,
                height: height,
                subtitle: "Your weekly financial report has been generated.",
                time: "3 days ago",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
