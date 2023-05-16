import 'package:flutter/material.dart';

class LIconButton extends StatelessWidget {
  const LIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.radius = 30,
    this.iconSize = 30,
    this.boxConstraints = const BoxConstraints(),
    this.padding = EdgeInsets.zero,
  }) : super(key: key);
  final Color? backgroundColor;
  final Function onPressed;
  final double radius;
  final double iconSize;
  final Widget icon;
  final BoxConstraints boxConstraints;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: CircleAvatar(
        radius: radius,
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.primary,
        child: IconButton(
          splashRadius: radius,
          padding: padding,
          constraints: boxConstraints,
          iconSize: iconSize,
          icon: icon,
          onPressed: () => onPressed(),
        ),
      ),
    );
  }
}
