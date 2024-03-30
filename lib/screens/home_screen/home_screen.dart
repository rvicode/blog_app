import 'package:blog_app/fake_data/data.dart';
import 'package:blog_app/screens/home_screen/widgets/category_widget.dart';
import 'package:blog_app/screens/home_screen/widgets/post_widget.dart';
import 'package:dotted_border/dotted_border.dart';
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

