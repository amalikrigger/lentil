import 'package:flutter/material.dart';

import '../widgets/l_elevated_button.dart';

enum Location { stx, stt }

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  Location? location = Location.stx;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/car_background_1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                textColor: Theme.of(context).colorScheme.onSurface,
                title: const Text('St. Croix'),
                leading: Radio<Location>(
                  value: Location.stx,
                  groupValue: location,
                  onChanged: (Location? value) {
                    setState(() {
                      location = value;
                    });
                  },
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                textColor: Theme.of(context).colorScheme.onSurface,
                title: const Text('St. Thomas'),
                leading: Radio<Location>(
                  value: Location.stt,
                  groupValue: location,
                  onChanged: (Location? value) {
                    setState(() {
                      location = value;
                    });
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LElevatedButton(
                        text: 'Apply Location',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
