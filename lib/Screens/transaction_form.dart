import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final Function(String, double, DateTime, String) addTransaction;

  TransactionForm({required this.addTransaction});

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;
  final categoryController = TextEditingController();

  // Submit form with access to context
  void _submitForm(BuildContext context) {
    final enteredTitle = titleController.text;
    final enteredAmount = double.tryParse(amountController.text) ?? 0.0;
    final enteredCategory = categoryController.text;

    if (enteredTitle.isEmpty || enteredAmount <= 0 || selectedDate == null || enteredCategory.isEmpty) {
      return; // Invalid input
    }

    // Pass data back to DashboardScreen
    addTransaction(enteredTitle, enteredAmount, selectedDate!, enteredCategory);

    // Close the form and navigate back
    Navigator.of(context).pop(); // Ensure this is called in the build context
  }

  void _presentDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Transaction')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _presentDatePicker(context),
              child: Text('Pick a Date'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _submitForm(context),  // Pass context here
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
