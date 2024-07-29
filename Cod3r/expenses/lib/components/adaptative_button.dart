import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;

  const AdaptativeButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;

    return isIOS
        ? CupertinoButton(
            child: Text(label),
            onPressed: onPressed,
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
          )
        : ElevatedButton(
            child: Text(label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            onPressed: onPressed,
            style: ButtonStyle(
              // backgroundColor: WidgetStateProperty.all<Color>(
              //   Theme.of(context).colorScheme.secondary,
              // ),
              // foregroundColor: WidgetStateProperty.all<Color>(
              //   Theme.of(context).colorScheme.onSecondary,
              // ),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
              side: WidgetStateProperty.all<BorderSide>(
                BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2.0,
                ),
              ),
            ),
          );
  }
}
