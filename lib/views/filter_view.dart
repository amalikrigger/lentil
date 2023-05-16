import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lentil/views/filter_options_view.dart';
import 'package:lentil/widgets/l_text_button.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as modal;

import '../pages/select_make_page.dart';
import '../widgets/filter_option.dart';
import '../widgets/l_elevated_button.dart';

enum Transmissions { automatic, manual, allTransmissions }

class FilterView extends StatefulWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  RangeValues _currentPriceRangeValues = const RangeValues(10, 100);
  double _currentMileageSliderValue = 0;
  Transmissions? _transmission = Transmissions.allTransmissions;
  bool _isTwentyFivePlus = false;
  bool _isThirtyPlus = false;
  final List<String> _seatOptions = [
    'All Seats',
    '4 or more',
    '5 or more',
    '6 or more',
    '7 or more',
    '8 or more'
  ];
  String _seatOptionText = 'All Seats';
  int _selectedItemIndex = 0;
  final FixedExtentScrollController _scrollController =
      FixedExtentScrollController(initialItem: 0);
  bool _isSelected = false;
  bool _showMoreOptions = false;

  void _showNumSeatsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.25,
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: GestureDetector(
              onTap: () => {Navigator.pop(context)},
              child: CupertinoPicker(
                scrollController: _scrollController,
                // Set the diameter of the picker wheel
                diameterRatio: 1,
                // Set the magnification of the center item
                magnification: 1.2,
                itemExtent: 40,
                // Set the currently selected item ind
                // Set the callback function that is called when an item is selected
                onSelectedItemChanged: (int index) {
                  setState(() {
                    _selectedItemIndex = index;
                    _seatOptionText = _seatOptions[_selectedItemIndex];
                  });
                },
                // Set the list of items to display in the picker
                children: List<Widget>.generate(
                  _seatOptions.length,
                  (index) {
                    return Center(
                      child: Text(
                        _seatOptions[index],
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

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
        appBar: AppBar(
          title: const Text(
            'Filter',
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: LTextButton(
                text: 'Reset',
                onPressed: () => {
                  print('Clicked reset button'),
                },
              ),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          color: Colors.white.withOpacity(0.8),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 108),
                  children: <Widget>[
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sort by',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              LTextButton(
                                text: 'Relevance',
                                onPressed: () => {
                                  modal.showCupertinoModalBottomSheet(
                                    expand: false,
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) =>
                                        const FilterOptionsView(),
                                  ),
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 16),
                      height: 160,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Price',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  '\$${_currentPriceRangeValues.start} - \$${_currentPriceRangeValues.end}+/day',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              RangeSlider(
                                values: _currentPriceRangeValues,
                                min: 10,
                                max: 250,
                                divisions: 48,
                                labels: RangeLabels(
                                  _currentPriceRangeValues.start
                                      .round()
                                      .toString(),
                                  _currentPriceRangeValues.end
                                      .round()
                                      .toString(),
                                ),
                                onChanged: (RangeValues values) {
                                  setState(() {
                                    _currentPriceRangeValues = values;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Exclusive cars for guests ages 25+',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Switch(
                              value: _isTwentyFivePlus,
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              onChanged: (bool value) {
                                // This is called when the user toggles the switch.
                                setState(() {
                                  _isTwentyFivePlus = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Exclusive cars for guests ages 30+',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Switch(
                              // This bool value toggles the switch.
                              value: _isThirtyPlus,
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              onChanged: (bool value) {
                                // This is called when the user toggles the switch.
                                setState(() {
                                  _isThirtyPlus = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 16),
                      height: 160,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Distance Included',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  _currentMileageSliderValue == 0
                                      ? 'Any mileage'
                                      : '$_currentMileageSliderValue mi/day or more',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Slider(
                                inactiveColor:
                                    Theme.of(context).colorScheme.primary,
                                activeColor: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.24),
                                thumbColor:
                                    Theme.of(context).colorScheme.primary,
                                value: _currentMileageSliderValue,
                                min: 0,
                                max: 500,
                                divisions: 10,
                                label: _currentMileageSliderValue
                                    .round()
                                    .toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    _currentMileageSliderValue = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 16.0,
                            ),
                            child: Text(
                              'Vehicle Type',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: GridView.count(
                              primary: false,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              crossAxisCount: 3,
                              childAspectRatio: 2,
                              physics: const NeverScrollableScrollPhysics(),
                              children: <Widget>[
                                FilterOption(
                                  text: 'Cars',
                                  isSelected: _isSelected,
                                  onSelectedChanged: (bool value) {
                                    setState(() {
                                      _isSelected = value;
                                    });
                                  },
                                ),
                                FilterOption(
                                  text: 'SUVs',
                                  isSelected: _isSelected,
                                  onSelectedChanged: (bool value) {
                                    setState(() {
                                      _isSelected = value;
                                    });
                                  },
                                ),
                                FilterOption(
                                  text: 'Trucks',
                                  isSelected: _isSelected,
                                  onSelectedChanged: (bool value) {
                                    setState(() {
                                      _isSelected = value;
                                    });
                                  },
                                ),
                                FilterOption(
                                  text: 'Minivans',
                                  isSelected: _isSelected,
                                  onSelectedChanged: (bool value) {
                                    setState(() {
                                      _isSelected = value;
                                    });
                                  },
                                ),
                                FilterOption(
                                  text: 'Vans',
                                  isSelected: _isSelected,
                                  onSelectedChanged: (bool value) {
                                    setState(() {
                                      _isSelected = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 16.0,
                            ),
                            child: Text(
                              'Green Vehicles',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: GridView.count(
                              primary: false,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              crossAxisCount: 3,
                              childAspectRatio: 2,
                              physics: const NeverScrollableScrollPhysics(),
                              children: <Widget>[
                                FilterOption(
                                  text: 'Electric',
                                  isSelected: _isSelected,
                                  onSelectedChanged: (bool value) {
                                    setState(() {
                                      _isSelected = value;
                                    });
                                  },
                                ),
                                FilterOption(
                                  text: 'Hybrid',
                                  isSelected: _isSelected,
                                  onSelectedChanged: (bool value) {
                                    setState(() {
                                      _isSelected = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 210,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0, top: 16),
                            child: Text(
                              'Transmission',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          ListTile(
                            title: const Text('All Transmissions'),
                            textColor: Theme.of(context).colorScheme.onSurface,
                            leading: Radio<Transmissions>(
                              value: Transmissions.allTransmissions,
                              groupValue: _transmission,
                              onChanged: (Transmissions? value) {
                                setState(() {
                                  _transmission = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('Automatic'),
                            textColor: Theme.of(context).colorScheme.onSurface,
                            leading: Radio<Transmissions>(
                              value: Transmissions.automatic,
                              groupValue: _transmission,
                              onChanged: (Transmissions? value) {
                                setState(() {
                                  _transmission = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('Manual'),
                            textColor: Theme.of(context).colorScheme.onSurface,
                            leading: Radio<Transmissions>(
                              value: Transmissions.manual,
                              groupValue: _transmission,
                              onChanged: (Transmissions? value) {
                                setState(() {
                                  _transmission = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 16, left: 16, right: 16, bottom: 8),
                      height: _showMoreOptions ? 392 : 251,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 16.0,
                            ),
                            child: Text(
                              'Features',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: _showMoreOptions ? 274 : 140,
                            child: GridView.count(
                              primary: false,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                              crossAxisCount: 3,
                              childAspectRatio: 2,
                              physics: const NeverScrollableScrollPhysics(),
                              children: <Widget>[
                                FilterOption(
                                  text: 'Wheelchair Accessible',
                                  fontSize: 14,
                                  isSelected: _isSelected,
                                  onSelectedChanged: (bool value) {
                                    setState(() {
                                      _isSelected = value;
                                    });
                                  },
                                ),
                                FilterOption(
                                  text: 'All-wheel drive',
                                  fontSize: 14,
                                  isSelected: _isSelected,
                                  onSelectedChanged: (bool value) {
                                    setState(() {
                                      _isSelected = value;
                                    });
                                  },
                                ),
                                FilterOption(
                                  text: 'Android Auto',
                                  fontSize: 14,
                                  isSelected: _isSelected,
                                  onSelectedChanged: (bool value) {
                                    setState(() {
                                      _isSelected = value;
                                    });
                                  },
                                ),
                                FilterOption(
                                  text: 'Apple Carplay',
                                  fontSize: 14,
                                  isSelected: _isSelected,
                                  onSelectedChanged: (bool value) {
                                    setState(() {
                                      _isSelected = value;
                                    });
                                  },
                                ),
                                FilterOption(
                                  text: 'Aux Input',
                                  fontSize: 14,
                                  isSelected: _isSelected,
                                  onSelectedChanged: (bool value) {
                                    setState(() {
                                      _isSelected = value;
                                    });
                                  },
                                ),
                                FilterOption(
                                  text: 'Backup Camera',
                                  fontSize: 14,
                                  isSelected: _isSelected,
                                  onSelectedChanged: (bool value) {
                                    setState(() {
                                      _isSelected = value;
                                    });
                                  },
                                ),
                                FilterOption(
                                  text: 'Bike rack',
                                  // visible: _showMoreOptions,
                                  fontSize: 14,
                                  isSelected: _isSelected,
                                  onSelectedChanged: (bool value) {
                                    setState(() {
                                      _isSelected = value;
                                    });
                                  },
                                ),
                                FilterOption(
                                  text: 'Blind spot warning',
                                  // visible: _showMoreOptions,
                                  fontSize: 14,
                                  isSelected: _isSelected,
                                  onSelectedChanged: (bool value) {
                                    setState(() {
                                      _isSelected = value;
                                    });
                                  },
                                ),
                                FilterOption(
                                  text: 'Bluetooth',
                                  // visible: _showMoreOptions,
                                  fontSize: 14,
                                  isSelected: _isSelected,
                                  onSelectedChanged: (bool value) {
                                    setState(() {
                                      _isSelected = value;
                                    });
                                  },
                                ),
                                FilterOption(
                                  text: 'Child seat',
                                  // visible: _showMoreOptions,
                                  fontSize: 14,
                                  isSelected: _isSelected,
                                  onSelectedChanged: (bool value) {
                                    setState(() {
                                      _isSelected = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: LTextButton(
                              text:
                                  _showMoreOptions ? 'Show Less' : 'Show More',
                              onPressed: () {
                                setState(() {
                                  _showMoreOptions = !_showMoreOptions;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Make',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          LTextButton(
                            text: 'All makes',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SelectMakeView(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Number of Seats',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          LTextButton(
                            text: _seatOptionText,
                            onPressed: () {
                              _showNumSeatsBottomSheet(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 40.0, right: 40.0, top: 0, bottom: 40),
                      child: LElevatedButton(
                        text: 'View Results',
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
