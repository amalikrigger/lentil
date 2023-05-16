import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as modal;

import '../views/calendar_view.dart';
import '../widgets/carousel_slider.dart';
import '../widgets/icon_text.dart';
import '../widgets/icon_widget.dart';
import '../widgets/l_icon_button.dart';
import '../widgets/l_text_button.dart';
import '../widgets/profile_picture.dart';

class CarDescPage extends StatefulWidget {
  const CarDescPage({Key? key}) : super(key: key);

  @override
  State<CarDescPage> createState() => _CarDescPageState();
}

class _CarDescPageState extends State<CarDescPage> {
  final _draggableScrollableController = DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        height: height,
        child: Stack(
          children: [
            InkWell(
              onTap: () => {print("Car selection")},
              child: CarouselSlider(
                showIndicators: false,
                height: height * .35,
                children: [
                  Image(
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter,
                    image: const AssetImage('assets/images/car_option_1.jpg'),
                    loadingBuilder: (context, child, event) {
                      if (event == null) {
                        return child;
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                  Image(
                    image: const AssetImage('assets/images/car_option_2.jpg'),
                    fit: BoxFit.fill,
                    loadingBuilder: (context, child, event) {
                      if (event == null) {
                        return child;
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                  Image(
                    image: const AssetImage('assets/images/car_option_3.jpg'),
                    fit: BoxFit.fill,
                    loadingBuilder: (context, child, event) {
                      if (event == null) {
                        return child;
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  padding: const EdgeInsets.all(20),
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () => {print('Liked car!')},
                  iconSize: 30,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  padding: const EdgeInsets.all(20),
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => {
                    Navigator.pop(context),
                  },
                  iconSize: 30,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
            DraggableScrollableSheet(
              controller: _draggableScrollableController,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/car_background_1.jpg'),
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
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.onSurface,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      controller: scrollController,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: width * .75,
                              height: 65,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Ford Mustang Shelby',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        size: 20,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        size: 20,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        size: 20,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant,
                                        size: 20,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text('30',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const ProfilePicture(
                                    profilePic:
                                        'assets/images/car_option_3.jpg',
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Joana Miaki Ichika',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                          Text(
                                            'Member since Jan 2018',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall!
                                                .copyWith(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        LIconButton(
                                          radius: 15,
                                          iconSize: 20,
                                          icon: Icon(
                                            Icons.messenger_outlined,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            size: 15,
                                          ),
                                          onPressed: () {},
                                        ),
                                        LIconButton(
                                          radius: 15,
                                          iconSize: 20,
                                          icon: Icon(
                                            Icons.phone,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            size: 15,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Trip Dates',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconWidget(
                                        iconData: Icons.calendar_month,
                                        widget: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Wed, Apr 5 at 10:00 AM',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                            Text(
                                              'Sat, Apr 8 at 10:00 AM',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                          ],
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                      ),
                                      LTextButton(
                                        text: 'Edit Date',
                                        onPressed: () {
                                          modal.showCupertinoModalBottomSheet(
                                            context: context,
                                            builder: (context) =>
                                                const CalendarView(),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              height: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Equipment',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Expanded(
                                    child: GridView.count(
                                      primary: false,
                                      crossAxisSpacing: 1,
                                      mainAxisSpacing: 1,
                                      crossAxisCount: 2,
                                      childAspectRatio: 5,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      children: <Widget>[
                                        IconText(
                                          iconData: Icons.severe_cold,
                                          text: 'Air Conditioning',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall!,
                                        ),
                                        IconText(
                                          iconData: Icons.gps_fixed,
                                          text: 'GPS',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall!,
                                        ),
                                        IconText(
                                          iconData: Icons.timelapse,
                                          text: 'Cruise Control',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall!,
                                        ),
                                        IconText(
                                          iconData: Icons.mode_standby_sharp,
                                          text: 'Manual',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall!,
                                        ),
                                        IconText(
                                          iconData: Icons.music_note_rounded,
                                          text: 'Music Player',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall!,
                                        ),
                                        IconText(
                                          iconData: Icons.wind_power,
                                          text: 'Winter Types',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall!,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              initialChildSize: 0.65,
              minChildSize: 0.65,
              maxChildSize: 1,
            ),
          ],
        ),
      ),
    );
  }
}
