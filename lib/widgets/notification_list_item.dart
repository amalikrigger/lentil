import 'package:flutter/material.dart';

import 'profile_picture.dart';

class NotificationListItem extends StatelessWidget {
  const NotificationListItem(
      {Key? key,
      required this.description,
      required this.profilePic,
      required this.date,
      required this.title,
      required this.onTap})
      : super(key: key);

  final String description;
  final String profilePic;
  final String date;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        onTap(),
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ProfilePicture(
                profilePic: 'assets/images/car_option_3.jpg',
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upcoming trip',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Your trip starts at 12:30 PM. Don\'t forget to check in when you arrive',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sat, Dec 3 at 10:31 AM',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            height: 35,
            thickness: 2,
            indent: 20,
            endIndent: 20,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ],
      ),
    );
  }
}
