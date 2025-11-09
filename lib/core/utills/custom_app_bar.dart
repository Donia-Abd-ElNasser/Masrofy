// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


import 'package:masrofy/core/utills/back_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.width,
    required this.text,
  });
final double width;
final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03,),
          child: Column(
            children: [
              SizedBox(height: 15,),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //  spacing: 20,
                children: [
                  
                  Backbutton(width: width),
                 SizedBox(width: width*0.18),
                 
                      Text(
                      text,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      )
                ],
              ),
               Divider(
              thickness: 1.2,
              color: Colors.grey,
            ),
            ],
          ),
        );
  }
}
