import 'package:flutter/material.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

  
    final passwordController = TextEditingController();
    final confirmController = TextEditingController();
    final obscurePassword1 = ValueNotifier(true);
    final obscurePassword2 = ValueNotifier(true);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.06,
            vertical: height * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: width * 0.12,
                height: width * 0.12,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              SizedBox(height: height * 0.05),

              Text(
                "Reset Your\nPassword",
                style: TextStyle(
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: height * 0.05),

              // Password field
              ValueListenableBuilder(
                valueListenable: obscurePassword1,
                builder: (context, value, _) => TextField(
                  controller: passwordController,
                  obscureText: value,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      onPressed: () {
                        obscurePassword1.value = !value;
                      },
                    ),
                    hintText: "Password",
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Colors.black, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.025),

              // Confirm Password
              ValueListenableBuilder(
                valueListenable: obscurePassword2,
                builder: (context, value, _) => TextField(
                  controller: confirmController,
                  obscureText: value,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      onPressed: () {
                        obscurePassword2.value = !value;
                      },
                    ),
                    hintText: "Confirm Password",
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Colors.black, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.07),

              SizedBox(
                width: double.infinity,
                height: height * 0.065,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    final password = passwordController.text.trim();
                    final confirm = confirmController.text.trim();

                    if (password.isEmpty || confirm.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please fill all fields")),
                      );
                    } else if (password != confirm) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Passwords do not match")),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Password reset successful!"),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Reset",
                    style: TextStyle(
                      fontSize: width * 0.045,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
