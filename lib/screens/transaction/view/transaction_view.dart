import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:masrofy/core/constants.dart';
import 'package:masrofy/core/utills/custom_app_bar.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({super.key});

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  String transactionType = "expense";
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String selectedCategory = "Select category";
  String selectedCurrency = "Egyptian pound";
  String selectedRepetition = "One time";
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: CustomAppBar(width: width, text: 'Add Transaction'),
      ),

      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage('assets/images/Frame 14368.png'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 73,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        radius: 13,
                        backgroundColor: Color(0xff53D258),
                        child: Icon(FontAwesomeIcons.plus, size: 15),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Add an Expense',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const VerticalDivider(
                    color: Colors.white,
                    thickness: 1,
                    endIndent: 20,
                    indent: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        radius: 13,
                        backgroundColor: Color(0xffE34747),
                        child: Icon(FontAwesomeIcons.minus, size: 15),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Withdraw money',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.03),

            // Amount + Currency Row
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Amount",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 2),
                      color: kPrimaryColor,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        iconDisabledColor: kPrimaryColor,
                        iconEnabledColor: kPrimaryColor,
                        value: selectedCurrency,
                        isExpanded: true,
                        dropdownColor: kPrimaryColor,
                        style: const TextStyle(color: Colors.black),
                        items: const [
                          DropdownMenuItem(
                            value: "Egyptian pound",
                            child: Text("EGP"),
                          ),
                          DropdownMenuItem(value: "USD", child: Text("USD")),
                          DropdownMenuItem(value: "EUR", child: Text("EUR")),
                        ],
                        onChanged: (value) {
                          setState(() => selectedCurrency = value!);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: height * 0.025),

            // Category
            DropdownButtonFormField<String>(
              value: selectedCategory,
              dropdownColor: kPrimaryColor,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
              ),
              items: const [
                DropdownMenuItem(
                  value: "Select category",
                  child: Text("Select category"),
                ),
                DropdownMenuItem(value: "Food", child: Text("Food")),
                DropdownMenuItem(value: "Transport", child: Text("Transport")),
                DropdownMenuItem(value: "Shopping", child: Text("Shopping")),
              ],
              onChanged: (value) => setState(() => selectedCategory = value!),
            ),

            SizedBox(height: height * 0.025),

            // Description
            TextField(
              controller: descriptionController,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: "Description",
                hintText: "Add a description (optional)",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),

            SizedBox(height: height * 0.025),

            // Date picker
            InkWell(
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                  initialDate: DateTime.now(),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          onSurface: Colors.black,
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (picked != null) setState(() => selectedDate = picked);
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: "Date",
                  suffixIcon: const Icon(Icons.calendar_month_outlined),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                child: Text(
                  selectedDate == null
                      ? "Select date"
                      : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                ),
              ),
            ),

            SizedBox(height: height * 0.025),

            // Repetition
            DropdownButtonFormField<String>(
              value: selectedRepetition,
              dropdownColor: kPrimaryColor,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
              ),
              items: const [
                DropdownMenuItem(value: "One time", child: Text("One time")),
                DropdownMenuItem(value: "Weekly", child: Text("Weekly")),
                DropdownMenuItem(value: "Monthly", child: Text("Monthly")),
              ],
              onChanged: (value) => setState(() => selectedRepetition = value!),
            ),

            SizedBox(height: height * 0.04),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0F3A1B),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Vector (1).png',
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 7),
                        const Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff5A1012),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.close, size: 18, color: Colors.white),
                        SizedBox(width: 4),
                        Text(
                          "Cancel",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
