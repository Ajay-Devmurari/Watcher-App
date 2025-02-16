import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/movies.dart';
import 'detail_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite Movies",
          style: GoogleFonts.nunito(
            fontSize: ht * 0.04,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: FavoriteMovies.favorites.isEmpty
          ? const Center(
              child: Text(
                "No favorites yet!",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: FavoriteMovies.favorites.length,
              itemBuilder: (context, index) {
                Movies movie = FavoriteMovies.favorites[index];
                return ListTile(
                  leading: Image.network(
                    'https://image.tmdb.org/t/p/w92${movie.posterPath}',
                    fit: BoxFit.cover,
                  ),
                  title:
                      Text(movie.title, style: const TextStyle(color: Colors.white)),
                  subtitle: Text("⭐ ${movie.voteAverage}",
                      style: const TextStyle(color: Colors.white70)),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(movie: movie),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

class FavoriteMovies {
  static List<Movies> favorites = [];
}
