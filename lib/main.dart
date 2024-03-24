import 'dart:ui';

import 'package:blog_app/fake_data/data.dart';
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
                fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(
                fontFamily: defaultfontfamily,
                color: secoundaryTextColor,
                fontSize: 14)),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final storys = AppDatabase.stories;
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: storys.length,
                  itemBuilder: (context, index) {
                    final story = storys[index];
                    return Column(
                      children: [
                        Container(
                          width: 68,
                          height: 68,
                          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                colors: [
                                  Color(0xff376AED),
                                  Color(0xff49B0E2),
                                  Color(0xff9CECFB)
                                ],
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset('assets/img/stories/${story.imageFileName}')),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          story.name,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    );
                  },
                ),
              )
            ]),
          )),
    );
  }
}
