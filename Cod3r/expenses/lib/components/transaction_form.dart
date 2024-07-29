import 'package:expenses/components/adaptative_button.dart';
import 'package:expenses/components/adaptative_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

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
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void initState() {
    super.initState();
    initializeDateFormatting('pt_BR', null);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0.0) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
    //todo - scrolldown
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;
    var alturaTela = mediaQuery.size.height;
    var alturaKeyboard = mediaQuery.viewInsets.bottom;

    return Container(
      height: isLandscape
          ? alturaTela * 0.90 + alturaKeyboard
          : alturaTela * 0.3 + alturaKeyboard,
      child: SingleChildScrollView(
        child: Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: 100 + mediaQuery.viewInsets.bottom,
                left: 10,
                right: 10,
                top: 10),
            child: Column(children: <Widget>[
              AdaptativeTextField(
                label: 'Título',
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptativeTextField(
                label: 'Valor (R\$)',
                controller: _valueController,
                onSubmitted: (_) => _submitForm(),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        _selectedDate == null
                            ? 'Nenhuma data selecionada!'
                            : 'Data Selecionada: ${DateFormat('dd MMMM y', 'pt_BR').format(_selectedDate)}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        )),
                    TextButton(
                      onPressed: _showDatePicker,
                      child: const Text('Selecionar Data',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                AdaptativeButton(
                  label: 'Nova transação',
                  onPressed: _submitForm,
                ),
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}
