import 'package:flutter/material.dart';

class BudgetScreen extends StatelessWidget {
  final List<Map<String, dynamic>> expenses;

  BudgetScreen({required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          final expense = expenses[index];
          return ListTile(
            title: Text(expense['name']),
            subtitle: Text(
                '${expense['category']} - \$${expense['amount']} \n${expense['description']}'),
          );
        },
      ),
    );
  }
}