import 'package:blog_app/fake_data/data.dart';
import 'package:blog_app/gen/assets.gen.dart';
import 'package:blog_app/screens/home_screen/widgets/category_widget.dart';
import 'package:blog_app/screens/home_screen/widgets/post_widget.dart';
import 'package:blog_app/screens/home_screen/widgets/story_image.dart';
import 'package:flutter/material.dart';


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
                      Assets.img.icons.notification.image(width: 34, height: 34),
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
                            ? storyImageViewed(story)
                            : storyImageNormal(story),
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
              const CategoryList(),
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
                    Posts(
                      textTheme: textTheme,
                    )
                  ],
                ),
              )
            ]),
          )),
    );
  }
}

