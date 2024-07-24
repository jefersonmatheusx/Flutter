import 'dart:math';

import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/theme/theme_constants.dart';
import 'package:expenses/theme/theme_manager.dart';
import 'package:expenses/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

ThemeManager _themeManager = ThemeManager();

class ExpensesApp extends StatefulWidget {
  const ExpensesApp({super.key});

  @override
  State<ExpensesApp> createState() => _ExpensesAppState();
}

class _ExpensesAppState extends State<ExpensesApp> {
  @override
  dispose() {
    _themeManager.removeListener(_themeListener);
    super.dispose();
  }

  @override
  initState() {
    _themeManager.addListener(_themeListener);
    super.initState();
  }

  _themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // final ThemeData tema = ThemeData();

    return MaterialApp(
      home: const MyHomePage(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      //  ThemeData(
      //   primarySwatch: Colors.purple,
      // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)
      //     .copyWith(secondary: Colors.amber),
      // scaffoldBackgroundColor: Colors.orange[100],

      // darkTheme: ThemeData.dark().copyWith(

      // ),

      // tema.copyWith(
      //   colorScheme: tema.colorScheme.copyWith(
      //     primary: Colors.green,
      //     secondary: Colors.amber,
      //   ),
      // textTheme: tema.textTheme.copyWith(
      //     titleMedium: const TextStyle(
      //       fontFamily: 'OpenSans',
      //       fontSize: 18,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.black,
      //     ),
      //     titleSmall: const TextStyle(
      //       fontFamily: 'OpenSans',
      //       fontSize: 18,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.black,
      //     ),
      //     labelMedium: TextStyle(
      //       fontFamily: 'OpenSans',
      //       fontSize: 18,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.green,
      //     )),
      // appBarTheme: AppBarTheme(
      //   titleTextStyle: TextStyle(
      //       fontFamily: 'OpenSans',
      //       fontSize: 22,
      //       fontWeight: FontWeight.bold,
      //       color: Theme.of(context).colorScheme.onPrimary),
      // ),
      // )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'Conta Antiga',
      value: 110.0,
      date: DateTime.now().subtract(const Duration(days: 33)),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Água',
      value: 45.0,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Transaction(
      id: 't3',
      title: 'Conta de Internet',
      value: 200.0,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Transaction(
      id: 't4',
      title: 'Conta de TV',
      value: 100000.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Conta de Telefone',
      value: 200.0,
      date: DateTime.now(),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );
    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => TransactionForm(
              onSubmit: _addTransaction,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          ),
          Switch(
            value: _themeManager.themeMode == ThemeMode.dark,
            onChanged: (value) {
              _themeManager.toggleTheme(value);
            },
          ),
        ],
        // backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Despesas pessoais',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_transactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Theme.of(context).colorScheme.primary,
        // foregroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 5,
        shape: const CircleBorder(),
        onPressed: () => _openTransactionFormModal(context),
        tooltip: 'Adicionar transação',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
