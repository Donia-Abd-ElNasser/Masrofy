import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masrofy/core/constants.dart';
import 'package:masrofy/core/utills/custom_app_bar.dart';
import 'package:masrofy/screens/Auth/view_model/auth_cubit/auth_cubit.dart';
import 'package:masrofy/screens/Auth/view_model/auth_cubit/auth_state.dart';
import 'package:masrofy/screens/home/view/widgets/pie_and_statistics.dart';
import 'package:masrofy/screens/home/view/widgets/smart_alert.dart';

class AnalyticsAndReportsView extends StatelessWidget {
  const AnalyticsAndReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: CustomAppBar(width: width, text: 'Analytics'),
      ),

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
                  /// ---------------------- PIE CHART ----------------------
                  if (user != null)
                    PieAndStatistics(height: height, userId: user.uid)
                  else
                    Center(
                      child: Text(
                        "Login to view statistics",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),

                  SizedBox(height: height * 0.02),

                  /// ---------------------- SMART ALERT ----------------------
                  SmartAlert(width: width),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
