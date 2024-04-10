import 'package:blog_app/gen/assets.gen.dart';
import 'package:blog_app/main.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;
  const BottomNavigation(
      {super.key, required this.onTap, required this.selectedIndex});

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
              child: Padding(
                padding: EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomNavigationItem(
                      iconFileName: 'Home.png',
                      activeiconFileName: 'Home.png',
                      title: 'Home',
                      onTap: () {
                        onTap(homeIndex);
                      },
                      isActive: selectedIndex == homeIndex,
                    ),
                    BottomNavigationItem(
                      iconFileName: 'Articles.png',
                      activeiconFileName: 'Articles.png',
                      title: 'Articles',
                      onTap: () {
                        onTap(articleIndex);
                      },
                      isActive: selectedIndex == articleIndex,
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    BottomNavigationItem(
                      iconFileName: 'Search.png',
                      activeiconFileName: 'Search.png',
                      title: 'Search',
                      onTap: () {
                        onTap(searchIndex);
                      },
                      isActive: selectedIndex == searchIndex,
                    ),
                    BottomNavigationItem(
                      iconFileName: 'Menu.png',
                      activeiconFileName: 'Menu.png',
                      title: 'Menu',
                      onTap: () {
                        onTap(profileIndex);
                      },
                      isActive: selectedIndex == profileIndex,
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
  final Function() onTap;
  final bool isActive;
  const BottomNavigationItem({
    super.key,
    required this.iconFileName,
    required this.activeiconFileName,
    required this.title,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Image.asset(
              'assets/img/icons/$iconFileName',
              color: isActive?themeData.colorScheme.primary:Colors.grey,
            ),
            Text(title,
                style: themeData.textTheme.bodySmall!.apply(
                    color:
                        isActive ? themeData.colorScheme.primary : Colors.grey))
          ],
        ),
      ),
    );
  }
}
