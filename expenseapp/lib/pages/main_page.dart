import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/pages/expense_list.dart';
import 'package:expenseapp/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //dummy data
  final List<Expense> expenses = [
    Expense(
        name: "Yiyecek",
        price: 200,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        name: "Flutter Udemy course",
        price: 400,
        date: DateTime.now(),
        category: Category.work)
  ]; // Firebase veritabanı

  void addExpense(Expense expense) {
    setState(() => {expenses.add(expense)});
  }

  void removeExpense(Expense expense) {
    setState(() {
      expenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense App"),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => NewExpense(
                  onAdd: (expense) => addExpense(expense),
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ExpenseList(expenses, removeExpense),
    );
  }
}
