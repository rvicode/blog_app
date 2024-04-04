import 'package:blog_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  bool bookMarkSaved = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 16, bottom: 8),
          child: InkWell(
            onTap: () {
              showSnackBar(context, 'Post is liked');
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xff376AED),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20,
                        color: themeData.colorScheme.primary.withOpacity(0.5))
                  ]),
              width: 111,
              height: 48,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Assets.img.icons.bilakh.svg(),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '2.1k',
                      style: themeData.textTheme.titleMedium!
                          .apply(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            CustomScrollView(slivers: [
              SliverAppBar(
                elevation: 1,
                pinned: true,
                floating: true,
                title: const Text('Article'),
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
              SliverList(
                  delegate: SliverChildListDelegate.fixed([
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
                  child: Text(
                    'Four Things Every Woman Needs To Know',
                    style: themeData.textTheme.headlineMedium!
                        .apply(fontWeightDelta: 2, fontSizeFactor: 0.9),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Assets.img.stories.story6
                              .image(width: 60, height: 60)),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Richard Gervain',
                              style: themeData.textTheme.titleMedium!
                                  .apply(color: const Color(0xff2D4379)),
                            ),
                            Text(
                              '2m ago',
                              style: themeData.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 75, right: 16),
                          child: InkWell(
                              onTap: () {},
                              child: const Icon(Icons.share_outlined,
                                  color: Color(0xff376AED)))),
                      InkWell(
                          onTap: () {
                            setState(() {
                              bookMarkSaved = !bookMarkSaved;
                            });
                          },
                          child: Icon(
                            bookMarkSaved == true
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: const Color(0xff376AED),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(28),
                            topRight: Radius.circular(28)),
                        image: DecorationImage(
                            image: AssetImage(
                                Assets.img.posts.large.singlePost.path),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 32, right: 32, top: 16, bottom: 16),
                  child: Text(
                    'A man’s sexuality is never your mind responsibility.',
                    style: themeData.textTheme.headlineSmall!
                        .apply(fontWeightDelta: 1),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 32, right: 32, bottom: 130),
                  child: Text(
                    'This one got an incredible amount of backlash the last time I said it, so I’m going to say it: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.',
                  ),
                )
              ])),
            ]),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  width: double.infinity,
                  height: 116,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                        Colors.white.withOpacity(0.7),
                        Colors.white.withAlpha(0)
                      ])),
                ))
          ],
        ));
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
