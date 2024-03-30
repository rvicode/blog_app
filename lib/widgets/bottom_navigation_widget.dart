import 'package:blog_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20,
                        color: const Color(0xff9b8487).withOpacity(0.6))
                  ],
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16))),
              child: const Padding(
                padding: EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomNavigationItem(
                      iconFileName: 'Home.png',
                      activeiconFileName: 'Home.png',
                      title: 'Home',
                    ),
                    BottomNavigationItem(
                      iconFileName: 'Articles.png',
                      activeiconFileName: 'Articles.png',
                      title: 'Articles',
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    BottomNavigationItem(
                      iconFileName: 'Search.png',
                      activeiconFileName: 'Search.png',
                      title: 'Search',
                    ),
                    BottomNavigationItem(
                      iconFileName: 'Menu.png',
                      activeiconFileName: 'Menu.png',
                      title: 'Menu',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.5),
                  border: Border.all(color: Colors.white, width: 4),
                  color: const Color(0xff376AED)),
              child: Assets.img.icons.plus.image(),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeiconFileName;
  final String title;
  const BottomNavigationItem({super.key, 
    required this.iconFileName,
    required this.activeiconFileName,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Image.asset(
          'assets/img/icons/$iconFileName',
        ),
        Text(title, style: textTheme.bodySmall!.apply(color: Colors.grey))
      ],
    );
  }
}
