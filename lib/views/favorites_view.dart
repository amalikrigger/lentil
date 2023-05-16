import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as modal;

import '../widgets/vehicle_favorite_list_item.dart';
import 'calendar_view.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Favorites'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const VehicleFavoriteListItem();
                },
              ),
              Visibility(
                visible: true,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                    padding: const EdgeInsets.only(bottom: 30),
                    iconSize: 50,
                    onPressed: () => {
                      modal.showCupertinoModalBottomSheet(
                        context: context,
                        builder: (context) => const CalendarView(),
                      ),
                    },
                    icon: Icon(
                      Icons.calendar_month,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
