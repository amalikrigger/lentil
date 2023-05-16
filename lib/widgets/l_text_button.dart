import 'package:flutter/material.dart';

class LTextButton extends StatelessWidget {
  const LTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.padding = const EdgeInsets.all(0),
    this.textColor,
  }) : super(key: key);

  final String text;
  final Function onPressed;
  final EdgeInsets padding;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextButton(
        onPressed: () => onPressed(),
        style: Theme.of(context).textButtonTheme.style,
        child: Text(
          text,
          style: TextStyle(
              color: textColor ?? Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
