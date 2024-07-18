import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Function onSubmit;

  TransactionForm({
    required this.onSubmit,
    super.key,
  });

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0.0) {
      return;
    }
    widget.onSubmit(title, value);
    //todo - scrolldown
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          TextField(
            onSubmitted: (_) => _submitForm(),
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Título',
            ),
          ),
          TextField(
            onSubmitted: (_) => _submitForm(),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            controller: valueController,
            decoration: InputDecoration(
              labelText: 'Valor (R\$)',
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton.icon(
              label: const Text('Nova transação'),
              icon: const Icon(Icons.add),
              onPressed: _submitForm,
            ),
          ]),
        ]),
      ),
    );
  }
}
