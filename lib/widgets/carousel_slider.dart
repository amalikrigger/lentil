import 'package:flutter/material.dart';

class CarouselSlider extends StatefulWidget {
  final Color backgroundOff;
  final Color backgroundOn;
  final double navigatorSize;
  final double height;
  final List<Widget> children;
  final double viewportFraction;
  final double spaceBetween;
  final bool animate;
  final int animationDuration;
  final Cubic animationCurve;
  final bool autoSlide;
  final int autoSlideDuration;
  final bool showIndicators;
  const CarouselSlider(
      {Key? key,
      this.children = const [],
      this.navigatorSize = 10,
      this.height = 200,
      this.viewportFraction = 1,
      this.spaceBetween = 10,
      this.animate = false,
      this.animationCurve = Curves.easeInOutCubic,
      this.animationDuration = 500,
      this.autoSlide = false,
      this.autoSlideDuration = 3,
      this.showIndicators = true,
      this.backgroundOff = Colors.black26,
      this.backgroundOn = Colors.black})
      : super(key: key);

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider>
    with TickerProviderStateMixin {
  late PageController _pageController;

  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(
        keepPage: true,
        initialPage: 0,
        viewportFraction: widget.viewportFraction);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: widget.height,
          width: double.infinity,
          child: PageView.builder(
            itemCount: widget.children.length,
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, pagePosition) {
              bool active = pagePosition == _currentPage;
              return widget.animate
                  ? slider(pagePosition, active)
                  : widget.children[pagePosition];
            },
          ),
        ),
        widget.showIndicators && widget.children.length > 1
            ? Container(
          height: widget.height,
          width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Align(
          alignment: Alignment.bottomCenter,
                child: SizedBox(
                    height: widget.navigatorSize,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: indicators(widget.children.length, _currentPage),
                    ),
                  ),
              ),
            )
            : const SizedBox(
                height: 0,
              ),
      ],
    );
  }

  List<Widget> indicators(length, currentIndex) {
    return List<Widget>.generate(
      length,
      (index) {
        return SizedBox(
          width: widget.navigatorSize + (widget.navigatorSize / 2),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: currentIndex == index
                  ? widget.backgroundOn
                  : widget.backgroundOff,
            ),
            onPressed: () {
              if (_pageController.hasClients) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
            ),
          ),
        );
      },
    );
  }

  AnimatedContainer slider(pagePosition, active) {
    double margin = active ? 0 : 20;
    return AnimatedContainer(
      duration: Duration(milliseconds: widget.animationDuration),
      curve: widget.animationCurve,
      margin: EdgeInsets.all(margin),
      child: widget.children[pagePosition],
    );
  }
}
