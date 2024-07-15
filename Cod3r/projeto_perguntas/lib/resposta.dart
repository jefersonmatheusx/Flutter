import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String resposta;
  final void Function() onPressed;
  
  Resposta(this.resposta, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:EdgeInsets.symmetric(vertical:10,horizontal:0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(resposta,style: TextStyle(color: Colors.white),),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey.withOpacity(0.5),
          disabledForegroundColor: Colors.white,
        ),
      ),
    );
  }
}
