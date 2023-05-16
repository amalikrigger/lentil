import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({Key? key, required this.profilePic, this.radius = 20})
      : super(key: key);

  final String profilePic;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
      backgroundImage: AssetImage(
        profilePic,
      ),
    );
  }
}
