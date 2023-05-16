import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../widgets/l_elevated_button.dart';
import '../widgets/l_text_button.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _dateRangeStart = DateTime.now();
  DateTime? _dateRangeEnd = DateTime.now().add(const Duration(days: 7));
  double _timeStartValue = 10 * 60;
  double _timeEndValue = 10 * 60;
  static const double _minValue = 0;
  static const double _maxValue = 23.5 * 60;

  String _getMonthName(DateTime date) {
    switch (date.month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "";
    }
  }

  String _getWeekName(DateTime date) {
    switch (date.weekday) {
      case 0:
        return "Sun";
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thu";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      default:
        return "Sun";
    }
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
            'Trip Date',
          ),
          actions: [
            LTextButton(
              padding: const EdgeInsets.only(right: 8),
              text: 'Reset',
              onPressed: () {
                setState(() {
                  _dateRangeStart = null;
                  _dateRangeEnd = null;
                  _timeStartValue = 10 * 60;
                  _timeEndValue = 10 * 60;
                });
              },
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Center(
            child: Column(
              children: [
                TableCalendar(
                  calendarStyle: CalendarStyle(
                    rangeStartDecoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle),
                    rangeEndDecoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle),
                    rangeHighlightColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.24),
                  ),
                  locale: "en_US",
                  rowHeight: 43,
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  availableGestures: AvailableGestures.all,
                  firstDay: DateTime.utc(DateTime.now().year,
                      DateTime.now().month, DateTime.now().day),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  rangeStartDay: _dateRangeStart,
                  rangeEndDay: _dateRangeEnd,
                  rangeSelectionMode: _rangeSelectionMode,
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                        _dateRangeStart = null; // Important to clean those
                        _dateRangeEnd = null;
                        _rangeSelectionMode = RangeSelectionMode.toggledOff;
                      });
                    }
                  },
                  onRangeSelected: (start, end, focusedDay) {
                    setState(
                      () {
                        _selectedDay = null;
                        _focusedDay = focusedDay;
                        _dateRangeStart = start;
                        _dateRangeEnd = end;
                        _rangeSelectionMode = RangeSelectionMode.toggledOn;
                        print('_rangeStart: $_dateRangeStart');
                        print('_rangeEnd: $_dateRangeEnd');
                      },
                    );
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Slider(
                    inactiveColor: Theme.of(context).colorScheme.primary,
                    activeColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.24),
                    thumbColor: Theme.of(context).colorScheme.primary,
                    value: _timeStartValue,
                    min: _minValue,
                    max: _maxValue,
                    divisions: (_maxValue - _minValue) ~/ 30,
                    label: TimeOfDay(
                            hour: _timeStartValue ~/ 60,
                            minute: _timeStartValue.toInt() % 60)
                        .format(context),
                    onChanged: (double value) {
                      setState(
                        () {
                          _timeStartValue = value;
                          print('_startValue: $_timeStartValue');
                        },
                      );
                    },
                  ),
                ),
                Slider(
                  inactiveColor: Theme.of(context).colorScheme.primary,
                  activeColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.24),
                  thumbColor: Theme.of(context).colorScheme.primary,
                  value: _timeEndValue,
                  min: _minValue,
                  max: _maxValue,
                  divisions: (_maxValue - _minValue) ~/ 30,
                  label: TimeOfDay(
                          hour: _timeEndValue ~/ 60,
                          minute: _timeEndValue.toInt() % 60)
                      .format(context),
                  onChanged: (double value) {
                    setState(
                      () {
                        _timeEndValue = value;
                        print('_endValue: $_timeEndValue');
                      },
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Theme.of(context).colorScheme.primary,
                          height: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _dateRangeStart?.day.toString() == null
                                  ? Text(
                                      'Start Date',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary),
                                    )
                                  : Text(
                                      '${_getWeekName(
                                        _dateRangeStart ?? DateTime.now(),
                                      )}, ${_getMonthName(
                                        _dateRangeStart ?? DateTime.now(),
                                      )} ${_dateRangeStart?.day.toString() ?? ''}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary),
                                    ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                TimeOfDay(
                                        hour: _timeStartValue ~/ 60,
                                        minute: _timeStartValue.toInt() % 60)
                                    .format(context),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Theme.of(context).colorScheme.background,
                          height: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _dateRangeEnd?.day.toString() == null
                                  ? Text(
                                      'End Date',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground),
                                    )
                                  : Text(
                                      '${_getWeekName(
                                        _dateRangeEnd ?? DateTime.now(),
                                      )}, ${_getMonthName(
                                        _dateRangeEnd ?? DateTime.now(),
                                      )} ${_dateRangeEnd?.day.toString() ?? ''}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground),
                                    ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                TimeOfDay(
                                        hour: _timeEndValue ~/ 60,
                                        minute: _timeEndValue.toInt() % 60)
                                    .format(context),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LElevatedButton(
                          text: 'Apply Date',
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
      ),
    );
  }
}
