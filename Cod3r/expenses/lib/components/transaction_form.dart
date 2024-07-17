import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final Function addTransaction;

  TransactionForm({
    super.key,
    required this.addTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Título',
            ),
          ),
          TextField(
            controller: valueController,
            decoration: InputDecoration(
              labelText: 'Valor (R\$)',
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton.icon(
              label: const Text('Nova transação'),
              icon: const Icon(Icons.add),
              onPressed: () {
                print(titleController.text);
                print(valueController.text);
                double valueDouble = double.parse(valueController.text);
                this.addTransaction(titleController.text, valueDouble);
              },
            ),
          ]),
        ]),
      ),
    );
  }
}
