import 'package:flutter/material.dart';

import '../widgets/notification_list_item.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Notifications'),
      ),
      body: Column(
        children: [
          Divider(
            height: 35,
            thickness: 2,
            indent: 0,
            endIndent: 0,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(
                16,
              ),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return NotificationListItem(
                    onTap: () => print('Go to notification'),
                    title: 'Upcoming trip',
                    profilePic: 'assets/images/car_option_3.jpg',
                    description:
                        'Your trip starts at 12:30 PM. Don\'t forget to check in when you arrive',
                    date: 'Sat, Dec 3 at 10:31 AM',
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
