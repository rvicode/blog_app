import 'package:blog_app/screens/home_screen/home_screen.dart';
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
  static const String defaultfontfamily = 'Avenir';
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secoundaryTextColor = Color(0xff2D4379);
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextThemes(secoundaryTextColor, primaryTextColor, defaultfontfamily),
        useMaterial3: true,
      ),
      home: Stack(
        children: [
          Positioned.fill(child: MyHomePage()),
          const Positioned(
              right: 0, left: 0, bottom: 0, child: BottomNavigation()),
        ],
      ),
    );
  }

}

