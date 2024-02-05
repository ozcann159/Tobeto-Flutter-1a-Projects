import 'package:expenseapp/models/category_expense.dart';
import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/chart/chart_bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key, required this.expenses}) : super(key: key);
  final List<Expense> expenses;

  List<CategoryExpense> get categoryExpense {
    return [
      CategoryExpense.forCategory(expenses, Category.education),
      CategoryExpense.forCategory(expenses, Category.travel),
      CategoryExpense.forCategory(expenses, Category.food),
      CategoryExpense.forCategory(expenses, Category.work),
    ];
  }

  double get maxTotal {
    double maxTotalExpense = 0;

    categoryExpense.forEach((element) {
      if (element.totalExpensePrice > maxTotalExpense)
        maxTotalExpense = element.totalExpensePrice;
    });

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.primary.withOpacity(0.3),
          Theme.of(context).colorScheme.primary.withOpacity(0.0),
        ]),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: categoryExpense
                  .map((categoryExpense) => ChartBar(
                        height: categoryExpense.totalExpensePrice / maxTotal,
                      ))
                  .toList(),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: categoryExpense
                .map((expense) =>
                    Expanded(child: Icon(categoryIcons[expense.category])))
                .toList(),
          ),
        ],
      ),
    );
  }
}
