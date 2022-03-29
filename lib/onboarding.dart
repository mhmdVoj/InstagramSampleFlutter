import 'package:blog_application/auth.dart';
import 'package:blog_application/data.dart';
import 'package:blog_application/gen/assets.gen.dart';
import 'package:blog_application/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 8),
              child: Assets.img.background.onboarding.image(),
            ),
          ),
          Container(
            height: 270,
            child: Column(children: [
              Expanded(
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index].title,
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                items[index].description,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .apply(fontSizeFactor: 0.8),
                              )
                            ],
                          ),
                        );
                      })),
              Container(
                height: 60,
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: items.length,
                        effect: ExpandingDotsEffect(
                            dotWidth: 8,
                            dotHeight: 8,
                            activeDotColor:
                                Theme.of(context).colorScheme.primary,
                            dotColor: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1)),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (page == items.length - 1) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const AuthScreen())));
                            } else {
                              _pageController.animateToPage(
                                page + 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.decelerate,
                              );
                            }
                          },
                          style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all(const Size(84, 60)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12)))),
                          child: Icon(page == items.length - 1
                              ? CupertinoIcons.check_mark
                              : CupertinoIcons.arrow_right))
                    ]),
              )
            ]),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(0.1),
                  )
                ],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32))),
          )
        ]),
      ),
    );
  }
}
