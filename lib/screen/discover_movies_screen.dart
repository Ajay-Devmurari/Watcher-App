import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api/apis.dart';
import '../constants/constants.dart';
import '../model/movies.dart';
import 'detail_screen.dart';

class DiscoverMoviesScreen extends StatefulWidget {
  const DiscoverMoviesScreen({
    super.key,
  });

  @override
  State<DiscoverMoviesScreen> createState() => _DiscoverMoviesScreenState();
}

class _DiscoverMoviesScreenState extends State<DiscoverMoviesScreen> {
  late Future<List<Movies>> disCoverMovies;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    disCoverMovies = Apis().getDiscoverMovies();
  }

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Discover Movies",
          style: GoogleFonts.nunito(
            fontSize: ht * 0.04,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: FutureBuilder(
        future: disCoverMovies,
        builder: (context, snapshot) {
          if (!snapshot.hasData && snapshot.hasError) {
            return const Center(child: Text("No movies found"));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(movie: snapshot.data![index]),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        '${Constants.imagePath}${snapshot.data![index].posterPath}',
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
