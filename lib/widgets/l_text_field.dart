import 'package:flutter/material.dart';

class LTextField extends StatefulWidget {
  const LTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.height = 46,
    this.labelStyle,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final double height;
  final TextStyle? labelStyle;

  @override
  State<LTextField> createState() => _LTextFieldState();
}

class _LTextFieldState extends State<LTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: Theme.of(context).inputDecorationTheme.border,
          focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
          enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
          errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
          disabledBorder: Theme.of(context).inputDecorationTheme.disabledBorder,
          labelStyle: widget.labelStyle ??
              Theme.of(context).inputDecorationTheme.labelStyle,
          labelText: widget.labelText,
          fillColor: Theme.of(context).inputDecorationTheme.fillColor,
          filled: Theme.of(context).inputDecorationTheme.filled,
          contentPadding: Theme.of(context).inputDecorationTheme.contentPadding,
        ),
        obscureText: widget.obscureText,
      ),
    );
  }
}
