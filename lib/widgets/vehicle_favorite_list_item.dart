import 'package:flutter/material.dart';

import '../pages/car_desc_page.dart';

class VehicleFavoriteListItem extends StatefulWidget {
  const VehicleFavoriteListItem({Key? key}) : super(key: key);

  @override
  State<VehicleFavoriteListItem> createState() =>
      _VehicleFavoriteListItemState();
}

class _VehicleFavoriteListItemState extends State<VehicleFavoriteListItem> {
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
                  Container(
                    height: 210,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/car_option_1.jpg'),
                      ),
                    ),
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
                            top: 5,
                          ),
                          child: Text(
                            '(74 trips)',
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
                            top: 5,
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
                  Divider(
                    height: 35,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 20,
                              bottom: 20,
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
