import 'package:blog_app/gen/assets.gen.dart';
import 'package:blog_app/screens/home_screen/widgets/post_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffF4F7FF),
      appBar: AppBar(
        backgroundColor: const Color(0xffF4F7FF),
        title: const Text('Profile'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: TextButton(
              onPressed: () {},
              child: const Icon(
                Icons.more_horiz_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 40),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 20,
                                  color: Colors.black.withOpacity(0.2)),
                            ]),
                        width: 295,
                        height: 290,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 40, top: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(22),
                                      child: Assets.img.stories.story5
                                          .image(width: 70, height: 70)),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '@joviedan',
                                        style: themeData.textTheme.bodyMedium,
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        'Jovi Daniel',
                                        style: themeData.textTheme.headlineSmall!
                                            .copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        'UX Designer',
                                        style: themeData.textTheme.bodySmall!
                                            .copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 32, left: 32),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'About Me',
                                    style: themeData.textTheme.headlineMedium!
                                        .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Text(
                                        style: themeData.textTheme.bodyMedium,
                                        'Madison Blackstone is a director of user experience design, with experience managing global teams.'),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      right: 70,
                      left: 70,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                            boxShadow: [BoxShadow(blurRadius: 35)]),
                      )),
                  Positioned(
                      bottom: 5,
                      right: 70,
                      left: 70,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xff386BED)),
                        width: 231,
                        height: 68,
                        child: const Padding(
                          padding: EdgeInsets.only(right: 16, left: 16, top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '52',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'Post',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    '250',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'Following',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    '4.5K',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'Followers',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 32,
                          ),
                          Text(
                            'My Posts',
                            style: themeData.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 160,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.grid_3x3_rounded,
                              )),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.menu),
                          ),
                        ],
                      ),
                    ),
                    Posts(textTheme: themeData.textTheme)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
