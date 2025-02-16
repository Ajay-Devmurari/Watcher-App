import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../screen/detail_screen.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data.length,
        options: CarouselOptions(
            autoPlay: true,
            height: 300,
            enlargeCenterPage: true,
            pageSnapping: true,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            autoPlayCurve: Curves.fastOutSlowIn,
            viewportFraction: 0.55),
        itemBuilder: (context, index, pageViewIndex) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailScreen(movie: snapshot.data[index]),
                )),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 400,
                child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    '${Constants.imagePath}${snapshot.data[index].posterPath}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
