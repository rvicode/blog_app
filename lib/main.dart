import 'package:flutter/material.dart';

void main() {
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
        textTheme: const TextTheme(
            titleMedium: TextStyle(
                fontFamily: defaultfontfamily,
                color: secoundaryTextColor,
                fontSize: 16),
            titleLarge: TextStyle(
                fontFamily: defaultfontfamily,
                color: primaryTextColor,
                fontWeight: FontWeight.bold)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 24, 32, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hi, Arvin!',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Image.asset(
                    'assets/img/icons/notification.png',
                    width: 24,
                    height: 24,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: Text('Explore todays',
                  style: Theme.of(context).textTheme.titleLarge),
            ),

          ])),
    );
  }
}
