import 'package:flutter/material.dart';

import '../pages/car_desc_page.dart';
import 'carousel_slider.dart';

class VehicleOption extends StatelessWidget {
  final int index;
  const VehicleOption({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
      child: InkWell(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CarDescPage(),
            ),
          ),
        },
        child: Container(
          height: 380,
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background.withOpacity(0.9),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    showIndicators: true,
                    height: 210,
                    backgroundOn: Theme.of(context).colorScheme.primary,
                    backgroundOff: Theme.of(context).colorScheme.onBackground,
                    children: [
                      Image(
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter,
                        image:
                            const AssetImage('assets/images/car_option_1.jpg'),
                        loadingBuilder: (context, child, event) {
                          if (event == null) {
                            return child;
                          }
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      ),
                      Image(
                        image:
                            const AssetImage('assets/images/car_option_2.jpg'),
                        fit: BoxFit.fill,
                        loadingBuilder: (context, child, event) {
                          if (event == null) {
                            return child;
                          }
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      ),
                      Image(
                        image:
                            const AssetImage('assets/images/car_option_3.jpg'),
                        fit: BoxFit.fill,
                        loadingBuilder: (context, child, event) {
                          if (event == null) {
                            return child;
                          }
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 15,
                          ),
                          child: Text(
                            'Tesla Model S 2018',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 18,
                            right: 15,
                            top: 10,
                          ),
                          child: Text(
                            '0.31 mi away: Kingshill • (74 trips)',
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 10,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Theme.of(context).colorScheme.primary,
                                size: 20,
                              ),
                              Icon(
                                Icons.star,
                                color: Theme.of(context).colorScheme.primary,
                                size: 20,
                              ),
                              Icon(
                                Icons.star,
                                color: Theme.of(context).colorScheme.primary,
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
                              Text(
                                '(30)',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 15.0,
                              bottom: 5,
                            ),
                            child: Text(
                              '\$45/day',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 15,
                              bottom: 15,
                            ),
                            child: Text(
                              '\$203 est. total',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  padding: const EdgeInsets.all(10),
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () => {print('Liked car!')},
                  iconSize: 30,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
