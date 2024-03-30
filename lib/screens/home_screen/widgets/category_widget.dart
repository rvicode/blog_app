import 'package:blog_app/carousel/carousel_slider.dart';
import 'package:blog_app/fake_data/data.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final category = AppDatabase.categories;
    return CarouselSlider.builder(
        itemCount: category.length,
        itemBuilder: (context, index, realIndex) {
          return CategoryItem(
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

class CategoryItem extends StatelessWidget {
  final Categories category;
  final double left;
  final double right;
  const CategoryItem({
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
