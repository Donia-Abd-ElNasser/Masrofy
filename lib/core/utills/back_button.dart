import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masrofy/core/routes.dart';

class Backbutton extends StatelessWidget {
  const Backbutton({super.key, required this.width});
final double width;
  @override
  Widget build(BuildContext context) {
    return  Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: width * 0.10,
                  height: width * 0.1,
                  child: IconButton(
                    onPressed: () {
                    (context).go(AppRoutes.kHomeView);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new,size: 16,),
                  ),
                )
;
  }
}