import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masrofy/core/utills/back_button.dart';
import 'package:masrofy/core/routes.dart';

class PhoneView extends StatelessWidget {
  const PhoneView({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    
    final double paddingH = width * 0.06; 
    final double paddingV = height * 0.02;
   
    final double buttonHeight = height * 0.07;

    return Scaffold(
      
      body: SafeArea(
        child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                Backbutton(width: width,),

                SizedBox(height: height * 0.17),

               
                Text(
                  "Enter Your Phone\nNumber",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    
                  ),
                ),

                SizedBox(height: height * 0.06),

               
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone_outlined),
                    hintText: "+00 0000000000",
                    hintStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 18,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.black87,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.05),

              
                SizedBox(
                  width: double.infinity,
                  height: buttonHeight,
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRoutes.kVerifyView);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Verification",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.022),

               
                SizedBox(
                  width: double.infinity,
                  height: buttonHeight,
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Later",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
