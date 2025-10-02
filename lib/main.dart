import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/expense_form_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Expense Manager',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ExpenseFormView(),
      debugShowCheckedModeBanner: false,
    );
  }
}