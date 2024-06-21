import 'package:flutter/material.dart';

class ExpensesScreen extends StatefulWidget {
  final List<Map<String, dynamic>> expenses;

  ExpensesScreen({required this.expenses});

  @override
  _ExpensesScreenState createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedCategory = "Food";

  void _saveExpense() {
    setState(() {
      widget.expenses.add({
        'name': _nameController.text,
        'amount': _amountController.text,
        'category': _selectedCategory,
        'description': _descriptionController.text,
      });
    });

    _nameController.clear();
    _amountController.clear();
    _descriptionController.clear();
    setState(() {
      _selectedCategory = "Food";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: "Name"),
          ),
          TextField(
            controller: _amountController,
            decoration: InputDecoration(labelText: "Amount"),
            keyboardType: TextInputType.number,
          ),
          ListTile(
            title: Text("Category"),
            trailing: DropdownButton<String>(
              value: _selectedCategory,
              items: ["Food", "Groceries", "Gas", "Entertainment", "Other"]
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
            ),
          ),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: "Description (Optional)"),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: _saveExpense,
              child: Text("Save Expense"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.expenses.length,
              itemBuilder: (context, index) {
                final expense = widget.expenses[index];
                return ListTile(
                  title: Text(expense['name']),
                  subtitle: Text(
                      '${expense['category']} - \$${expense['amount']} \n${expense['description']}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}