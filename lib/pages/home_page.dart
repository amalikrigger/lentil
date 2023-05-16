import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lentil/views/explore_view.dart';

import '../views/account_view.dart';
import '../views/favorites_view.dart';
import '../views/notifications_view.dart';
import '../views/trips_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTabIndex = 0;

  onTapped(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  List<Widget> tabs = [
    const ExploreView(),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.purple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    if (isIOS) {
      return CupertinoTabScaffold(
        backgroundColor: Colors.transparent,
        tabBar: CupertinoTabBar(
          height: 65,
          activeColor: Theme.of(context).colorScheme.primary,
          inactiveColor: Theme.of(context).colorScheme.onSurfaceVariant,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.car_detailed),
              label: "Trips",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart_fill),
              label: "Favorites",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bell_fill),
              label: "Notifications",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_alt),
              label: "Account",
            )
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return const ExploreView();
            case 1:
              return const TripsView();
            case 2:
              return const FavoritesView();
            case 3:
              return const NotificationsView();
            case 4:
              return const AccountView();
            default:
              return const ExploreView();
          }
        },
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/car_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: tabs[_currentTabIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
            currentIndex: _currentTabIndex,
            onTap: onTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Explore",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.car_detailed),
                label: "Trips",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart_fill),
                label: "Favorites",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bell_fill),
                label: "Notifications",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_alt),
                label: "Account",
              ),
            ],
          ),
        ),
      );
    }
  }
}
