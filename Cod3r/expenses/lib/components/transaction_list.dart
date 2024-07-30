import 'package:expenses/components/transaction_item.dart';
import 'package:expenses/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String id) deleteTransaction;
  const TransactionList(
    this.transactions,
    this.deleteTransaction, {
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                children: [
                  Text('Nenhuma Transação Cadastrada',
                      style: Theme.of(context).textTheme.titleLarge),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: FittedBox(
                      child: Image.asset('assets/images/waiting.png',
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return TransactionItem(
                  tr: tr, deleteTransaction: deleteTransaction);
            });
  }
}
