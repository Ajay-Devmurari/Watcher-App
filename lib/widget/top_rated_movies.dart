import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../screen/detail_screen.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailScreen(movie: snapshot.data[index]),
                  )),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      '${Constants.imagePath}${snapshot.data[index].posterPath}'),
                ),
              ),
            );
          }),
    );
  }
}
