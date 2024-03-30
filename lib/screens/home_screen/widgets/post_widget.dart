import 'package:blog_app/fake_data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  final TextTheme textTheme;
  const Posts({required this.textTheme});

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
          return PostItem(
            post: post[index],
            textTheme: textTheme,
          );
        },
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final PostData post;
  final TextTheme textTheme;
  const PostItem({
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
