import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  const ChartBar(
      {required this.label,
      required this.value,
      required this.percentage,
      super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Column(children: <Widget>[
        Container(
          height: constraints.maxHeight * 0.15,
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text('${value.toStringAsFixed(2)}')),
        ),
        SizedBox(height: constraints.maxHeight * 0.05),
        Container(
          height: constraints.maxHeight * 0.60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: constraints.maxHeight * 0.05),
        Container(
          height: constraints.maxHeight * 0.15,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(label),
          ),
        ),
      ]);
    });
  }
}
