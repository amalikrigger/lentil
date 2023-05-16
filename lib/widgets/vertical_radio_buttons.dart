import 'package:flutter/material.dart';

class VerticalRadioButtons extends StatefulWidget {
  final List<String> options;
  final Function(int) onSelect;
  const VerticalRadioButtons(
      {Key? key, required this.options, required this.onSelect})
      : super(key: key);

  @override
  State<VerticalRadioButtons> createState() => _VerticalRadioButtonsState();
}

class _VerticalRadioButtonsState extends State<VerticalRadioButtons> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(widget.options.length, (index) {
            return RadioListTile(
              title: Text(
                widget.options[index],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              value: index,
              groupValue: _selected,
              onChanged: (value) {
                setState(() {
                  _selected = value as int;
                  widget.onSelect(_selected);
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
            );
          }),
        ),
      ),
    );
  }
}
