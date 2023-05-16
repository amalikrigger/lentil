import 'package:flutter/material.dart';

class FilterOption extends StatelessWidget {
  // Constructor for the FilterOption widget
  const FilterOption({
    Key? key, // Optional Key parameter for identifying the widget
    required this.text, // Required parameter for the text displayed on the widget
    required this.isSelected, // Required parameter for whether the widget is selected
    required this.onSelectedChanged, // Required parameter for the callback when the selection state changes
    this.padding = const EdgeInsets.all(
        5), // Optional parameter for the padding around the widget
    this.fontSize = 17, // Optional parameter for the font size of the text
    this.height = 65, // Optional parameter for the height of the widget
    this.width =
        double.infinity, // Optional parameter for the width of the widget
    this.selectedBorderColor, // Optional parameter for the border color when the widget is selected
    this.unselectedBorderColor, // Optional parameter for the border color when the widget is unselected
    this.borderRadius = const BorderRadius.all(
      Radius.circular(8),
    ), // Optional parameter for the border radius of the widget
    this.textAlign = TextAlign.center,
    this.visible = true,
  }) : super(key: key);

  final double height; // Final variable for the height of the widget
  final double width; // Final variable for the width of the widget
  final String text; // Final variable for the text displayed on the widget
  final bool isSelected; // Final variable for whether the widget is selected
  final ValueChanged<bool>
      onSelectedChanged; // Final variable for the callback when the selection state changes
  final double fontSize; // Final variable for the font size of the text
  final BorderRadius
      borderRadius; // Final variable for the border radius of the widget
  final EdgeInsets padding; // Final variable for the padding around the widget
  final Color?
      selectedBorderColor; // Final variable for the border color when the widget is selected
  final Color?
      unselectedBorderColor; // Final variable for the border color when the widget is unselected
  final TextAlign textAlign;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      replacement: const SizedBox.shrink(),
      child: Container(
        padding: padding, // Set the padding of the container
        height: height, // Set the height of the container
        width: width, // Set the width of the container
        child: OutlinedButton(
          onPressed: () {
            // Set the callback function for when the button is pressed
            onSelectedChanged(
                !isSelected); // Call the callback function with the new selection state
          },
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: isSelected
                  ? selectedBorderColor ??
                      Theme.of(context).colorScheme.onSurface
                  : unselectedBorderColor ??
                      Theme.of(context).colorScheme.primary,
            ), // Set the border color based on the selection state
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ), // Set the border radius of the button
          ),
          child: Text(
            text,
            textAlign: textAlign,
            style: TextStyle(
              fontSize: fontSize, // Set the font size of the text
              color: isSelected
                  ? selectedBorderColor ??
                      Theme.of(context).colorScheme.onSurface
                  : unselectedBorderColor ??
                      Theme.of(context)
                          .colorScheme
                          .primary, // Set the text color based on the selection state
            ),
          ),
        ),
      ),
    );
  }
}
