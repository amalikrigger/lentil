import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData iconData;
  final String text;
  final TextStyle style;
  final double iconSize;
  final Color? iconColor;

  const IconText({
    Key? key,
    required this.iconData,
    required this.text,
    this.iconSize = 20,
    this.iconColor,
    this.style = const TextStyle(fontSize: 16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: iconSize,
          color: iconColor ?? Theme.of(context).colorScheme.onSurface,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: style,
        ),
      ],
    );
  }
}
