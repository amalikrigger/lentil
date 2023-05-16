import 'package:flutter/material.dart';
import 'package:lentil/widgets/l_text_button.dart';

class FilterOptionsView extends StatelessWidget {
  const FilterOptionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              LTextButton(
                text: 'Relevance',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              LTextButton(
                text: 'Price: low to high',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              LTextButton(
                text: 'Price: high to low',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              LTextButton(
                text: 'Distance away',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
