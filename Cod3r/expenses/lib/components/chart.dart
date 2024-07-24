import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatefulWidget {
  final List<Transaction> recentTransaction;

  const Chart(this.recentTransaction, {super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < widget.recentTransaction.length; i++) {
        bool sameDay = widget.recentTransaction[i].date.day == weekDay.day;
        bool sameMonth =
            widget.recentTransaction[i].date.month == weekDay.month;
        bool sameYear = widget.recentTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += widget.recentTransaction[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactions.map((tr) {
              return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                    label: tr['day'].toString(),
                    value: tr['value'] as double,
                    percentage: (tr['value'] as double) / _weekTotalValue,
                  ));
            }).toList(),
          ),
        ),
      ),
    );
  }
}
