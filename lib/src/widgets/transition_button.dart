import 'package:flutter/material.dart';

class TransitionButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const TransitionButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
