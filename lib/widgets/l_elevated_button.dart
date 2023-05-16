import 'package:flutter/material.dart';

class LElevatedButton extends StatefulWidget {
  const LElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height = 50,
    this.width = double.infinity,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(8),
    ),
  }) : super(key: key);

  final double height;
  final double width;
  final String text;
  final Function onPressed;
  final BorderRadius borderRadius;

  @override
  State<LElevatedButton> createState() => _LElevatedButtonState();
}

class _LElevatedButtonState extends State<LElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style,
        child: Text(
          widget.text,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w600),
        ),
        onPressed: () {
          widget.onPressed();
        },
      ),
    );
  }
}
