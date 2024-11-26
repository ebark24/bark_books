import 'package:bark_books/Screens/transaction_form.dart';
import 'package:bark_books/Screens/transaction_list.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Transaction> _transactions = []; // List to store transactions

  // Function to add a new transaction
  void _addTransaction(String title, double amount, DateTime date, String category) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
      category: category,
    );

    setState(() {
      _transactions.add(newTransaction); // Add transaction to the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookkeeping Dashboard'),
      ),
      body: Stack( // Stack to position the image in the top-right corner
        children: [
          // The rest of the screen layout
          Column(
            children: [
              Expanded(
                child: TransactionList(transactions: _transactions), // Pass transactions to list
              ),
            ],
          ),
          // Image positioned in the top-right corner
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'Assets/BarkBooks.png',  // Path to your logo image
                width: 200,  // Adjust size as needed
                height: 200,  // Adjust size as needed
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to TransactionForm and wait for result
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TransactionForm(
                addTransaction: _addTransaction,
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
