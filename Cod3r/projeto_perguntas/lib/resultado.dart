import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado({
    required this.pontuacao,
    required this.quandoReiniciarQuestionario,
    super.key,
  });

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return "Impressionante!";
    } else {
      return 'Nivel Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text(fraseResultado, style: TextStyle(fontSize: 25))),
        BackButton(onPressed: this.quandoReiniciarQuestionario,)
      ],
    );
  }
}
