import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masrofy/core/constants.dart';
import 'package:masrofy/core/utills/custom_app_bar.dart';
import 'package:masrofy/screens/Auth/view_model/auth_cubit/auth_cubit.dart';
import 'package:masrofy/screens/Auth/view_model/auth_cubit/auth_state.dart';
import 'package:masrofy/screens/transaction/view_model/cubit.dart';
import 'package:masrofy/screens/transaction/view_model/states.dart';

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

  // ------- SNACKS ------
  void showError(String msg) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.red));
  }

  void showSuccess(String msg) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.green));
  }

  // ------- SAVE LOGIC ------
  void save(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    final user = authCubit.currentUser;

    if (user == null) {
      showError("Please login first");
      return;
    }

    if (amountController.text.isEmpty) {
      showError("Enter amount");
      return;
    }

    final amount = double.tryParse(amountController.text);
    if (amount == null) {
      showError("Invalid amount");
      return;
    }

    if (selectedCategory == "Select category") {
      showError("Choose category");
      return;
    }

    if (selectedDate == null) {
      showError("Choose date");
      return;
    }

    context.read<TransactionCubit>().createTransaction(
      userId: user.uid,
      amount: amount,
      description: descriptionController.text,
      category: selectedCategory,
      currency: selectedCurrency,
      transactionType: transactionType,
      repetition: selectedRepetition,
      date: selectedDate!,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocListener<TransactionCubit, TransactionState>(
      listener: (context, state) {
        if (state is TransactionSuccess) showSuccess(state.message);
        if (state is TransactionError) showError(state.message);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          title: CustomAppBar(width: width, text: 'Add Transaction'),
        ),

        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, authState) {
            final user = context.read<AuthCubit>().currentUser;

            // USER NOT LOGGED IN
            if (user == null) {
              return Center(
                child: Text(
                  "Please login first",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              );
            }

            // USER LOGGED IN → SHOW UI
            return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),

                  // ---------------- HEADER BOX ----------------
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

      // ------------------ INCOME BUTTON ------------------
      GestureDetector(
        onTap: () => setState(() => transactionType = "income"),
        child: Opacity(
          opacity: transactionType == "income" ? 1 : 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 13,
                backgroundColor: const Color(0xff53D258),
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
        ),
      ),

      const VerticalDivider(
        color: Colors.white,
        thickness: 1,
        endIndent: 20,
        indent: 20,
      ),

      // ------------------ EXPENSE BUTTON ------------------
      GestureDetector(
        onTap: () => setState(() => transactionType = "expense"),
        child: Opacity(
          opacity: transactionType == "expense" ? 1 : 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 13,
                backgroundColor: const Color(0xffE34747),
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
        ),
      ),
    ],
  ),
)
,

                  SizedBox(height: height * 0.03),

                  // ---------------- AMOUNT + CURRENCY ----------------
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            labelText: "Amount",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(
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
                              value: selectedCurrency,
                              isExpanded: true,
                              dropdownColor: kPrimaryColor,
                              items: const [
                                DropdownMenuItem(
                                  value: "Egyptian pound",
                                  child: Text("EGP"),
                                ),
                                DropdownMenuItem(
                                  value: "USD",
                                  child: Text("USD"),
                                ),
                                DropdownMenuItem(
                                  value: "EUR",
                                  child: Text("EUR"),
                                ),
                              ],
                              onChanged:
                                  (v) => setState(() => selectedCurrency = v!),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.025),

                  // ---------------- CATEGORY ----------------
                  DropdownButtonFormField<String>(
                    value: selectedCategory,
                    dropdownColor: kPrimaryColor,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
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
                    items: const [
                      DropdownMenuItem(
                        value: "Select category",
                        child: Text("Select category"),
                      ),

                      // ------------------- OLD CATEGORIES ----------------------
                      DropdownMenuItem(value: "Food", child: Text("Food")),
                      DropdownMenuItem(
                        value: "Transport",
                        child: Text("Transport"),
                      ),
                      DropdownMenuItem(
                        value: "Shopping",
                        child: Text("Shopping"),
                      ),

                      // ------------------- NEW CATEGORIES ----------------------
                      DropdownMenuItem(
                        value: "Electronics",
                        child: Text("Electronics"),
                      ),
                      DropdownMenuItem(
                        value: "Supermarket purchases",
                        child: Text("Supermarket purchases"),
                      ),
                      DropdownMenuItem(
                        value: "Installments",
                        child: Text("Installments"),
                      ),
                       DropdownMenuItem(
                        value: "Monthly income",
                        child: Text("Monthly income"),
                      ),
                       DropdownMenuItem(
                        value: "Extra Work",
                        child: Text("Extra Work"),
                      ),
                      DropdownMenuItem(
                        value: "Restaurant lunch",
                        child: Text("Restaurant lunch"),
                      ),
                      DropdownMenuItem(
                        value: "Car fuel",
                        child: Text("Car fuel"),
                      ),
                    ],
                    onChanged:
                        (value) => setState(() => selectedCategory = value!),
                  ),

                  SizedBox(height: height * 0.025),

                  // ---------------- DESCRIPTION ----------------
                  TextField(
                    controller: descriptionController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: "Description",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.025),

                  // ---------------- DATE ----------------
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
                                primary:
                                    Colors
                                        .black, // Selected date, header background
                                onPrimary: Colors.white, // Text on header
                                onSurface: Colors.black, // Body text (days)
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      Colors.black, // OK & CANCEL buttons
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );

                      if (picked != null) {
                        setState(() {
                          selectedDate = picked;
                        });
                      }
                    },
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: "Date",
                        labelStyle: const TextStyle(color: Colors.black),
                        floatingLabelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        suffixIcon: const Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.black,
                        ),
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
                      child: Text(
                        selectedDate == null
                            ? "Select date"
                            : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.025),

                  // ---------------- REPETITION ----------------
                  DropdownButtonFormField<String>(
                    value: selectedRepetition,
                    dropdownColor: kPrimaryColor,
                    items: const [
                      DropdownMenuItem(
                        value: "One time",
                        child: Text("One time"),
                      ),
                      DropdownMenuItem(value: "Weekly", child: Text("Weekly")),
                      DropdownMenuItem(
                        value: "Monthly",
                        child: Text("Monthly"),
                      ),
                    ],
                    onChanged: (v) => setState(() => selectedRepetition = v!),
                  ),

                  SizedBox(height: height * 0.04),

                  // ---------------- BUTTONS ----------------
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => save(context),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor:transactionType=='income'? Color(0xff0F3A1B):Color(0xff5A1012),
                            padding: EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/Vector (1).png',
                                width: 16,
                                height: 16,
                              ),
                              SizedBox(width: 7),
                              Text(
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
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: const Color(0xFF1E1E1E),
                            padding: EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
            );
          },
        ),
      ),
    );
  }
}
