import 'package:flutter/material.dart';

import '../models/onboard.dart';
import '../pages/home_page.dart';
import '../widgets/l_elevated_button.dart';
import '../widgets/l_icon_button.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({
    Key? key,
    required this.onboard,
    required this.pageController,
    required this.index,
    required this.length,
    this.currentPage = 0,
  }) : super(key: key);
  final Onboard onboard;
  final PageController pageController;
  final int currentPage;
  final int index;
  final int length;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0.5),
            Colors.black.withOpacity(0.5),
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 40.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Center(
                child: SizedBox(
                  height: 280,
                  width: 260,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LIconButton(
                        icon: Icon(
                          onboard.icon,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        onPressed: () {},
                      ),
                      Column(
                        children: [
                          Text(
                            onboard.title,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            onboard.description,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List<Widget>.generate(
                            length,
                            (index) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                width: 10,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    backgroundColor: currentPage == index
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                  ),
                                  onPressed: () {
                                    if (pageController.hasClients) {
                                      pageController.animateToPage(
                                        index,
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              LElevatedButton(
                width: 331,
                text: length == (index + 1) ? 'Getting started' : 'Next',
                onPressed: () {
                  if (length == (index + 1)) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  } else {
                    if (pageController.hasClients) {
                      pageController.animateToPage(
                        index + 1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
