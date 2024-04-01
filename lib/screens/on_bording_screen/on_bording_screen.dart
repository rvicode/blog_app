import 'package:blog_app/fake_data/data.dart';
import 'package:blog_app/gen/assets.gen.dart';
import 'package:blog_app/screens/auth/auth_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  final PageController _pageController = PageController();
  final items = AppDatabase.onBoardingItems;
  int page = 0;
  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page!.round() != page) {
        setState(() {
          page = _pageController.page!.round();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                SizedBox(
                  child: Assets.img.background.onboarding
                      .image(width: double.infinity, height: 470),
                ),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28),
                          topRight: Radius.circular(28)),
                      boxShadow: [
                        BoxShadow(blurRadius: 20, color: Color(0xffC4C4C4))
                      ]),
                  child: Column(
                    children: [
                      Expanded(
                          child: PageView.builder(
                        itemCount: items.length,
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.only(
                                top: 16, left: 32, right: 32),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  items[index].title,
                                  style: themeData.textTheme.headlineMedium!
                                      .apply(fontSizeFactor: 0.8),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  items[index].description,
                                  style: themeData.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          );
                        },
                      )),
                      Container(
                        padding: const EdgeInsets.only(
                            right: 32, left: 32, bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmoothPageIndicator(
                              controller: _pageController,
                              count: items.length,
                              effect: ExpandingDotsEffect(
                                dotWidth: 8,
                                dotHeight: 8,
                                activeDotColor: themeData.colorScheme.primary,
                                dotColor: themeData.colorScheme.primary
                                    .withOpacity(0.2),
                              ),
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xff376AED)),
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(88, 55)),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  page != items.length - 1
                                      ? _pageController.animateToPage(page + 1,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.decelerate)
                                      : Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AuthScreen()));
                                },
                                child: Icon(
                                  page != items.length - 1
                                      ? CupertinoIcons.arrow_right
                                      : CupertinoIcons.check_mark,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                )),
              ],
            )));
  }
}
