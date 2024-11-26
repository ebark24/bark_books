import 'package:bark_books/Models/transaction_item.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';


class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  // Constructor to receive the transactions
  TransactionList({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Center(
            child: Text(
              'No transactions added yet!',
              style: TextStyle(fontSize: 16),
            ),
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return TransactionItem(transaction: transactions[index]);
            },
          );
  }
}
