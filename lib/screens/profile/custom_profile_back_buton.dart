import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomProfileBackButon extends StatelessWidget {
  const CustomProfileBackButon({super.key, required this.width, required this.text});
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
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: width * 0.10,
                  height: width * 0.1,
                  child: IconButton(
                    onPressed: () {
                    (context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new,size: 16,),
                  ),
                ),
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