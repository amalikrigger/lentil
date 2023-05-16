import 'package:flutter/material.dart';
import '../widgets/vertical_radio_buttons.dart';

class SelectMakeView extends StatefulWidget {
  const SelectMakeView({Key? key}) : super(key: key);

  @override
  State<SelectMakeView> createState() => _SelectMakeViewState();
}

class _SelectMakeViewState extends State<SelectMakeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: VerticalRadioButtons(
        options: const ['AM General', 'Acura', 'Alfa-Romeo', 'Aston Martin', 'Audi',
          'BMW', 'Bentley', 'Buick', 'Cadillac', 'Can-Am', 'Chevrolet',
          'Chrysler', 'Delorean', 'Dodge', 'Ferrari', 'Fiat', 'Fisker', 'Ford'],
        onSelect: (int selected) {
          Navigator.pop(context);
        },
      ),
    );
  }
}
