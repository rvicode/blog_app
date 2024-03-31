import 'package:blog_app/fake_data/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';


Widget storyImageNormal(StoryData story) {
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
              child: Image.asset('assets/img/stories/${story.imageFileName}')),
        ),
      ),
    ),
  );
}

Widget storyImageViewed(StoryData story) {
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
