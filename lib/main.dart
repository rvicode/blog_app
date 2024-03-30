import 'package:blog_app/gen/fonts.gen.dart';
import 'package:blog_app/screens/splash_screen/splash_screen.dart';
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
          textTheme: TextThemes(
              secoundaryTextColor, primaryTextColor, defaultfontfamily),
          useMaterial3: true,
        ),
        home: const SplashScreen());
  }
}
