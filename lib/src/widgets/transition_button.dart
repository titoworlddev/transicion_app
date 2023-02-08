import 'package:flutter/material.dart';

class TransitionButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color color;

  const TransitionButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.color = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
