import 'package:flutter/material.dart';
import 'package:lentil/views/calendar_view.dart';
import 'package:lentil/views/filter_view.dart';
import 'package:lentil/views/search_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as modal;

import '../widgets/l_elevated_button.dart';
import '../widgets/vehicle_option.dart';
import 'map_view.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  Color pageBackgroundColor = Colors.transparent;
  Color headingShadowColor = Colors.transparent;
  Color headingBackgroundColor = Colors.transparent;
  MaterialType headingMaterialType = MaterialType.transparency;
  bool toggleMapButton = false;
  bool hideMap = false;
  final _draggableScrollableController = DraggableScrollableController();
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackgroundColor,
      body: Stack(
        children: [
          const MapView(),
          Visibility(
            visible: hideMap,
            child: Container(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SafeArea(
            child: Stack(
              children: [
                DraggableScrollableSheet(
                  controller: _draggableScrollableController,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return NotificationListener<
                        DraggableScrollableNotification>(
                      onNotification:
                          (DraggableScrollableNotification notification) {
                        if ((notification.maxExtent - notification.extent) <
                            0.1) {
                          setState(() {
                            pageBackgroundColor =
                                Theme.of(context).colorScheme.primary;
                            headingBackgroundColor =
                                Theme.of(context).colorScheme.primary;
                            headingShadowColor =
                                Colors.black87.withOpacity(0.4);
                            headingMaterialType = MaterialType.canvas;
                            toggleMapButton = true;
                            hideMap = true;
                          });
                        } else {
                          setState(() {
                            pageBackgroundColor = Colors.transparent;
                            headingBackgroundColor = Colors.transparent;
                            headingShadowColor = Colors.transparent;
                            headingMaterialType = MaterialType.transparency;
                            toggleMapButton = false;
                            hideMap = false;
                          });
                        }
                        return false;
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/car_background_1.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: 10,
                              child: Container(
                                alignment: Alignment.center,
                                height: 5,
                                width: 40,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 36,
                              left: 20,
                              child: Text(
                                '10 cars available',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 90,
                                          bottom: 40),
                                      controller: scrollController,
                                      itemCount: 10,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        _scrollController = scrollController;
                                        return VehicleOption(
                                          index: index + 1,
                                        );
                                        //   ListTile(
                                        //   title: Text("Car $index"),
                                        // );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  initialChildSize: 0.5,
                  minChildSize: 0.1,
                  maxChildSize: 1,
                  snapSizes: const [0.1, 0.5, 1],
                  snap: true,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: headingBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: headingShadowColor,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      elevatedButtonTheme: ElevatedButtonThemeData(
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                elevatedButtonTheme: ElevatedButtonThemeData(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder>(
                                      const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                          topRight: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              child: LElevatedButton(
                                text: 'St. Croix',
                                height: 40,
                                onPressed: () {
                                  modal.showCupertinoModalBottomSheet(
                                    context: context,
                                    builder: (context) => const SearchView(),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                elevatedButtonTheme: ElevatedButtonThemeData(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder>(
                                      const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              child: LElevatedButton(
                                text: '11/27 - 11/30',
                                height: 40,
                                onPressed: () {
                                  modal.showCupertinoModalBottomSheet(
                                    context: context,
                                    builder: (context) => const CalendarView(),
                                  );
                                  // _selectDate(context);
                                },
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                elevatedButtonTheme: ElevatedButtonThemeData(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder>(
                                      const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(0),
                                          bottomLeft: Radius.circular(0),
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              child: LElevatedButton(
                                text: 'Filter',
                                height: 40,
                                onPressed: () {
                                  modal.showCupertinoModalBottomSheet(
                                    context: context,
                                    builder: (context) => const FilterView(),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: toggleMapButton,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                      padding: const EdgeInsets.only(bottom: 30),
                      iconSize: 50,
                      onPressed: () => {
                        _draggableScrollableController.animateTo(0.1,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.ease),
                        _scrollController.animateTo(
                          0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOut,
                        ),
                      },
                      icon: Icon(
                        Icons.map_outlined,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
