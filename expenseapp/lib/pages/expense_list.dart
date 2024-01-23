import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({Key? key}) : super(key: key);

  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  //dummy data
  final List<Expense> expenses = [
    Expense(
        name: "Yiyecek",
        price: 200,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        name: "Flutter Udemy course",
        price: 200,
        date: DateTime.now(),
        category: Category.work)
  ]; // Firebase veritabanı

  //Listview render

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
