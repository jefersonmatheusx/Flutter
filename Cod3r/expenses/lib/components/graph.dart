import 'package:flutter/material.dart';

class Graph extends StatefulWidget {
  const Graph({super.key});

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Card(
        color: Colors.blue,
        elevation: 5,
        child: Text('Gráfico'),
      ),
    );
  }
}
