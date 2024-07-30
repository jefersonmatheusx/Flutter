import 'package:expenses/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction tr;
  final void Function(String) deleteTransaction;
  const TransactionItem(
      {super.key, required this.tr, required this.deleteTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child:
                  FittedBox(child: Text('R\$ ${tr.value.toStringAsFixed(2)}')),
            )),
        title: Text(
          tr.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(DateFormat('d MMM y').format(tr.date)),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).colorScheme.error,
          onPressed: () => deleteTransaction(tr.id),
        ),
      ),
    );
  }
}
