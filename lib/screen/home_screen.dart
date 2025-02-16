import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../api/apis.dart';
import '../model/movies.dart';
import '../widget/slider.dart';
import '../widget/top_rated_movies.dart';
import '../widget/up_coming_movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movies>> trendingMovies;
  late Future<List<Movies>> topRatedMovies;
  late Future<List<Movies>> upComingMovies;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trendingMovies = Apis().getTrendingMovies();
    topRatedMovies = Apis().getTopRatedMovies();
    upComingMovies = Apis().getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Watcher',
            style: GoogleFonts.nunito(
              fontSize: ht * 0.04,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sectionTitle('Trending movies', ht),
                FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return const Center(child: Text("Failed to load movies"));
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text("No movies found"));
                    }

                    return TrendingSlider(snapshot: snapshot);
                  },
                ),
                sectionTitle('Top rated movies', ht),
                FutureBuilder(
                  future: topRatedMovies,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return const Center(child: Text("Failed to load movies"));
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text("No movies found"));
                    }

                    return TopRatedMovies(snapshot: snapshot);
                  },
                ),
                sectionTitle('Upcoming movies', ht),
                FutureBuilder(
                  future: upComingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return const Center(child: Text("Failed to load movies"));
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text("No movies found"));
                    }

                    return UpComingMovies(snapshot: snapshot);
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Widget sectionTitle(String title, double ht) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: GoogleFonts.lato(
          fontSize: ht * 0.028,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
