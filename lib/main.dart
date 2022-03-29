import 'package:blog_application/article.dart';
import 'package:blog_application/gen/fonts.gen.dart';
import 'package:blog_application/home.dart';
import 'package:blog_application/profile.dart';
import 'package:blog_application/search.dart';
import 'package:blog_application/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int profileIndex = 3;
const double bottomNavigationHeight = 65;

class MyApp extends StatelessWidget {
  static const defaultFontFamily = 'Avenir';
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primaryTextColor = Color(0xff0D253C);
    final secondaryTextColor = Color(0xff2D4379);
    const primaryButtonColor = Color(0xff376aed);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          snackBarTheme: const SnackBarThemeData(
            backgroundColor: primaryButtonColor,
          ),
          appBarTheme: AppBarTheme(
            titleSpacing: 32,
            backgroundColor: Colors.white,
            foregroundColor: primaryTextColor,
          ),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.avenir)))),
          colorScheme: ColorScheme.light(
              primary: primaryButtonColor,
              onPrimary: Colors.white,
              onSurface: primaryTextColor,
              background: const Color(0xfffbfcff),
              surface: Colors.white,
              onBackground: primaryTextColor),
          textTheme: TextTheme(
              headline6: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: primaryTextColor),
              bodyText2: TextStyle(
                  fontFamily: FontFamily.avenir,
                  color: secondaryTextColor,
                  fontSize: 12),
              bodyText1: TextStyle(
                  fontFamily: FontFamily.avenir,
                  color: primaryTextColor,
                  fontSize: 14),
              headline4: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: primaryTextColor),
              headline5: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: primaryTextColor),
              subtitle1: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 18,
                  fontWeight: FontWeight.w200,
                  color: secondaryTextColor),
              subtitle2: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: secondaryTextColor),
              caption: const TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff7b8bb2)))),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;
  final List<int> _history = [];

  GlobalKey<NavigatorState> _homeKey = GlobalKey();
  GlobalKey<NavigatorState> _articleKey = GlobalKey();
  GlobalKey<NavigatorState> _searchKey = GlobalKey();
  GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    searchIndex: _searchKey,
    profileIndex: _profileKey,
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currnetSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currnetSelectedTabNavigatorState.canPop()) {
      currnetSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: bottomNavigationHeight,
              child: IndexedStack(
                index: selectedScreenIndex,
                children: [
                  Navigator(
                      key: _homeKey,
                      onGenerateRoute: (settings) => MaterialPageRoute(
                          builder: (context) => const HomeScreen())),
                  Navigator(
                      key: _articleKey,
                      onGenerateRoute: (settings) => MaterialPageRoute(
                          builder: (context) => const ArticleScreen())),
                  Navigator(
                      key: _searchKey,
                      onGenerateRoute: (settings) => MaterialPageRoute(
                          builder: (context) => const SearchScreen())),
                  Navigator(
                      key: _profileKey,
                      onGenerateRoute: (settings) => MaterialPageRoute(
                          builder: (context) => const ProfileScreen())),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _BottomNavigation(
                selectedIndex: selectedScreenIndex,
                onSelectedTabChange: (int index) {
                  setState(() {
                    _history.remove(selectedScreenIndex);
                    _history.add(selectedScreenIndex);
                    selectedScreenIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  final Function(int index) onSelectedTabChange;
  final int selectedIndex;

  const _BottomNavigation(
      {Key? key,
      required this.onSelectedTabChange,
      required this.selectedIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 85,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: bottomNavigationHeight,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BottomNavigationItem(
                          iconFileName: 'Home.png',
                          activeIconFileName: 'HomeActive.png',
                          onTap: () {
                            onSelectedTabChange(homeIndex);
                          },
                          isActive: selectedIndex == homeIndex,
                          title: 'Home'),
                      BottomNavigationItem(
                          iconFileName: 'Articles.png',
                          onTap: () {
                            onSelectedTabChange(articleIndex);
                          },
                          activeIconFileName: 'ArticlesActive.png',
                          isActive: selectedIndex == articleIndex,
                          title: 'Articles'),
                      Expanded(child: Container()),
                      BottomNavigationItem(
                          iconFileName: 'Search.png',
                          onTap: () {
                            onSelectedTabChange(searchIndex);
                          },
                          activeIconFileName: 'SearchActive.png',
                          isActive: selectedIndex == searchIndex,
                          title: 'Search'),
                      BottomNavigationItem(
                          iconFileName: 'Menu.png',
                          onTap: () {
                            onSelectedTabChange(profileIndex);
                          },
                          activeIconFileName: 'MenuActive.png',
                          isActive: selectedIndex == profileIndex,
                          title: 'Menu')
                    ]),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      color: const Color(0xff9b8487).withOpacity(0.3))
                ]),
              ),
            ),
            Center(
              child: Container(
                width: 65,
                height: 85,
                alignment: Alignment.topCenter,
                child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                        color: const Color(0xff376aed),
                        border: Border.all(color: Colors.white, width: 4),
                        borderRadius: BorderRadius.circular(32.5)),
                    child: Image.asset('assets/img/icons/plus.png')),
              ),
            )
          ],
        ));
  }
}

class BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;
  final bool isActive;
  final Function() onTap;

  const BottomNavigationItem(
      {Key? key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title,
      required this.onTap,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/icons/${isActive ? activeIconFileName : iconFileName}',
              height: 24,
              width: 24,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: themeData.textTheme.caption!.apply(
                  color: isActive
                      ? themeData.colorScheme.primary
                      : themeData.textTheme.caption!.color),
            )
          ],
        ),
      ),
    );
  }
}
