import 'package:flutter/material.dart';

class CheckboxText extends StatefulWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Widget label;
  final TextStyle? labelStyle;
  const CheckboxText({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.labelStyle,
  }) : super(key: key);

  @override
  State<CheckboxText> createState() => _CheckboxTextState();
}

class _CheckboxTextState extends State<CheckboxText> {
  late bool _value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _value = !_value;
          widget.onChanged!(_value);
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 22,
            child: Checkbox(
              value: _value,
              onChanged: (value) => {
                setState(
                  () {
                    _value = !_value;
                    widget.onChanged!(_value);
                  },
                ),
              },
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          widget.label,
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }
}
