import 'package:flutter/material.dart';

class TripsView extends StatelessWidget {
  const TripsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Trips'),
          automaticallyImplyLeading: false,
          bottom: TabBar(
            labelColor: Theme.of(context).colorScheme.onSurface,
            indicatorColor: Theme.of(context).colorScheme.primary,
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            tabs: const [
              Tab(
                text: 'Booked',
              ),
              Tab(
                text: 'History',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}
