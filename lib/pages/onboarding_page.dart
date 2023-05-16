import 'package:flutter/material.dart';
import 'package:lentil/pages/home_page.dart';

import '../models/onboard.dart';
import '../views/onboarding_view.dart';
import '../widgets/l_text_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;
  int _currentPage = 0;
  var _onboardList = [];

  @override
  void initState() {
    _pageController =
        PageController(keepPage: true, initialPage: 0, viewportFraction: 1);
    _onboardList = [
      const Onboard(
        title: 'Browse',
        description:
            'Browse the best car for your daily, anywhere, anytime easily and without difficulty',
        icon: Icons.search,
      ),
      const Onboard(
        title: 'Order',
        description:
            'Order your favorite car with a choice of prices and specifications',
        icon: Icons.shopping_cart,
      ),
      const Onboard(
        title: 'Enjoy',
        description:
            'Enjoy your trip happily and smiling almost anywhere in the city with family and friends',
        icon: Icons.car_rental,
      ),
    ];
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/car_background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            PageView.builder(
              itemCount: _onboardList.length,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                return OnboardView(
                  onboard: _onboardList[pagePosition],
                  pageController: _pageController,
                  currentPage: _currentPage,
                  index: pagePosition,
                  length: _onboardList.length,
                );
              },
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: _onboardList.length == (_currentPage + 1)
                      ? LTextButton(text: '', onPressed: () => {})
                      : LTextButton(
                          text: 'Skip',
                          textColor: Theme.of(context).colorScheme.surface,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
