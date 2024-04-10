import 'package:blog_app/gen/fonts.gen.dart';
import 'package:blog_app/screens/article_screen/article_screen.dart';
import 'package:blog_app/screens/home_screen/home_screen.dart';
import 'package:blog_app/screens/profile_screen/profile_screen.dart';
import 'package:blog_app/screens/search_screen/search_screen.dart';
import 'package:blog_app/widgets/bottom_navigation_widget.dart';
import 'package:blog_app/widgets/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String defaultfontfamily = FontFamily.avenir;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secoundaryTextColor = Color(0xff2D4379);
    return MaterialApp(
        theme: ThemeData(
          colorScheme: const ColorScheme.light(primary: Color(0xff376AED)),
          textTheme: TextThemes(
              secoundaryTextColor, primaryTextColor, defaultfontfamily),
          useMaterial3: true,
        ),
        home: const MainScreen());
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int profileIndex = 3;
const double bottomNavigationHight = 65;

class _MainScreenState extends State<MainScreen> {
  int selectScreenIndex = homeIndex;
  final List<int> _history = [];

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _articleKey = GlobalKey();
  final GlobalKey<NavigatorState> _searchKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    searchIndex: _searchKey,
    profileIndex: _profileKey,
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
      selectScreenIndex = _history.last;
      _history.removeLast();
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                bottom: bottomNavigationHight,
                right: 0,
                left: 0,
                child: IndexedStack(
                  index: selectScreenIndex,
                  children: [
                    Navigator(
                        key: _homeKey,
                        onGenerateRoute: (settings) => MaterialPageRoute(
                            builder: (context) => MyHomePage())),
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
                right: 0,
                left: 0,
                child: BottomNavigation(
                  onTap: (int index) {
                    setState(() {
                      _history.remove(selectScreenIndex);
                      _history.add(selectScreenIndex);
                      selectScreenIndex = index;
                    });
                  },
                  selectedIndex: selectScreenIndex,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
