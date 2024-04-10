import 'package:blog_app/gen/fonts.gen.dart';
import 'package:blog_app/screens/article_screen/article_screen.dart';
import 'package:blog_app/screens/home_screen/home_screen.dart';
import 'package:blog_app/screens/profile_screen/profile_screen.dart';
import 'package:blog_app/screens/search_screen/search_screen.dart';
import 'package:blog_app/widgets/bottom_navigation_widget.dart';
import 'package:blog_app/widgets/theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: bottomNavigationHight,
            right: 0,
            left: 0,
            child: IndexedStack(
              index: selectScreenIndex,
              children: [
                MyHomePage(),
                ArticleScreen(),
                SearchScreen(),
                ProfileScreen()
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: BottomNavigation(onTap: (int index) {
                    setState(() {
            selectScreenIndex = index;
                    });
                  }, selectedIndex: selectScreenIndex,),
          ),
        ],
      ),
    );
  }
}
