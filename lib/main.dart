import 'package:blog_app/carousel/carousel_slider.dart';
import 'package:blog_app/fake_data/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
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
            bodySmall: TextStyle(
                fontFamily: defaultfontfamily,
                fontSize: 14,
                color: Color(0xff376AED),
                fontWeight: FontWeight.w700),
            bodyMedium: TextStyle(
                fontFamily: defaultfontfamily,
                color: secoundaryTextColor,
                fontSize: 14)),
        useMaterial3: true,
      ),
      home: Stack(
        children: [
          Positioned.fill(child: MyHomePage()),
          const Positioned(
              right: 0, left: 0, bottom: 0, child: _BottomNavigation()),
        ],
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({super.key});

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
                        color: const Color(0xff9b8487).withOpacity(0.4))
                  ],
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16))),
              child: const Padding(
                padding: EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _BottomNavigationItem(
                      iconFileName: 'Home.png',
                      activeiconFileName: 'Home.png',
                      title: 'Home',
                    ),
                    _BottomNavigationItem(
                      iconFileName: 'Articles.png',
                      activeiconFileName: 'Articles.png',
                      title: 'Articles',
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    _BottomNavigationItem(
                      iconFileName: 'Search.png',
                      activeiconFileName: 'Search.png',
                      title: 'Search',
                    ),
                    _BottomNavigationItem(
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
              child: Image.asset('assets/img/icons/plus.png'),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeiconFileName;
  final String title;
  const _BottomNavigationItem({
    super.key,
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

class MyHomePage extends StatelessWidget {
  final storys = AppDatabase.stories;
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
                      style: textTheme.titleMedium,
                    ),
                    Image.asset(
                      'assets/img/icons/notification.png',
                      width: 34,
                      height: 34,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                child: Text('Explore today`s', style: textTheme.titleLarge),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  scrollDirection: Axis.horizontal,
                  itemCount: storys.length,
                  itemBuilder: (context, index) {
                    final story = storys[index];
                    return Column(
                      children: [
                        story.isViewed
                            ? _storyImageViewed(story)
                            : _storyImageNormal(story),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          story.name,
                          style: textTheme.bodyMedium,
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const _CategoryList(),
              SizedBox(
                height: 500,
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 24, left: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Laset News',
                            style: textTheme.titleLarge,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'More',
                                style: textTheme.titleMedium!.apply(
                                    color: const Color(0xff376AED),
                                    fontSizeFactor: 0.9),
                              ))
                        ],
                      ),
                    ),
                    _Posts(
                      textTheme: textTheme,
                    )
                  ],
                ),
              )
            ]),
          )),
    );
  }

  Widget _storyImageNormal(StoryData story) {
    return Container(
      width: 68,
      height: 68,
      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            colors: [Color(0xff376AED), Color(0xff49B0E2), Color(0xff9CECFB)],
          )),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child:
                    Image.asset('assets/img/stories/${story.imageFileName}')),
          ),
        ),
      ),
    );
  }

  Widget _storyImageViewed(StoryData story) {
    return Container(
      width: 68,
      height: 68,
      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: DottedBorder(
          borderType: BorderType.RRect,
          dashPattern: const [8, 3],
          radius: const Radius.circular(20),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child:
                      Image.asset('assets/img/stories/${story.imageFileName}')),
            ),
          ),
        ),
      ),
    );
  }
}

class _Posts extends StatelessWidget {
  final TextTheme textTheme;
  const _Posts({super.key, required this.textTheme});

  @override
  Widget build(BuildContext context) {
    final post = AppDatabase.posts;

    return SizedBox(
      height: 450,
      width: double.infinity,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemExtent: 141,
        itemCount: post.length,
        itemBuilder: (context, index) {
          return _PostItem(
            post: post[index],
            textTheme: textTheme,
          );
        },
      ),
    );
  }
}

class _PostItem extends StatelessWidget {
  final PostData post;
  final TextTheme textTheme;
  const _PostItem({
    super.key,
    required this.post,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(blurRadius: 20, color: Color(0x1a5282FF)),
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.asset('assets/img/posts/small/${post.imageFileName}'),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.caption,
                  style: textTheme.bodySmall,
                ),
                Text(
                  post.title,
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      CupertinoIcons.hand_thumbsup,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      post.likes,
                      style: textTheme.bodyMedium!.apply(fontSizeFactor: 0.8),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Icon(
                      CupertinoIcons.clock,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      post.time,
                      style: textTheme.bodyMedium!.apply(fontSizeFactor: 0.8),
                    ),
                    Expanded(
                      child: Container(
                          alignment: Alignment.centerRight,
                          child: post.isBookmarked
                              ? const Icon(
                                  CupertinoIcons.bookmark_fill,
                                  size: 16,
                                )
                              : const Icon(
                                  CupertinoIcons.bookmark,
                                  size: 16,
                                )),
                    ),
                    const SizedBox(
                      width: 15,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList();

  @override
  Widget build(BuildContext context) {
    final category = AppDatabase.categories;
    return CarouselSlider.builder(
        itemCount: category.length,
        itemBuilder: (context, index, realIndex) {
          return _CategoryItem(
              left: realIndex == 0 ? 32 : 8,
              right: realIndex == category.length - 1 ? 32 : 8,
              category: category[realIndex]);
        },
        options: CarouselOptions(
            disableCenter: false,
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.8,
            aspectRatio: 1.2,
            initialPage: 0,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height));
  }
}

class _CategoryItem extends StatelessWidget {
  final Categories category;
  final double left;
  final double right;
  const _CategoryItem({
    required this.category,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(
        children: [
          Positioned.fill(
              top: 100,
              left: 50,
              right: 50,
              bottom: 25,
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(blurRadius: 20, color: Color(0xff0D253C))
                ]),
              )),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(32)),
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color(0xff0D253C), Colors.transparent])),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(
                    'assets/img/posts/large/${category.imageFileName}',
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Positioned(
              bottom: 50,
              left: 36,
              child: Text(
                category.title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .apply(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
