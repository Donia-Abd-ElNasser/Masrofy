
import 'package:flutter/material.dart';

import 'package:masrofy/core/utills/back_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.width, required this.text});
  final double width;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        children: [
          SizedBox(height: 15),
          Row(
       
            children: [
              Backbutton(width: width),
              SizedBox(width: 10),

              Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Divider(thickness: 1.2, color: Colors.grey),
        ],
      ),
    );
  }
}
