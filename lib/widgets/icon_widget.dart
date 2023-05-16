import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData iconData;
  final double iconSize;
  final Color? iconColor;
  final Widget widget;
  final EdgeInsets padding;

  const IconWidget({
    Key? key,
    required this.iconData,
    required this.widget,
    this.padding = EdgeInsets.zero,
    this.iconSize = 25,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Icon(
            iconData,
            size: iconSize,
            color: iconColor ?? Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 10),
          widget,
        ],
      ),
    );
  }
}
