import 'dart:convert';
import '../constants/constants.dart';
import '../model/movies.dart';
import 'package:http/http.dart' as http;

class Apis {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/week?api_key=${Constants.apiKey}';
  static const _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _upComingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';
  static const _disCoverMoviesUrl =
      'https://api.themoviedb.org/3/discover/movie?api_key=${Constants.apiKey}';
  Future<List<Movies>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'] as List;
      return data.map((movie) => Movies.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load data");
    }
  }

  Future<List<Movies>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'] as List;
      return data.map((movie) => Movies.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load data");
    }
  }

  Future<List<Movies>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upComingUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'] as List;
      return data.map((movie) => Movies.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load data");
    }
  }
  Future<List<Movies>> getDiscoverMovies() async {
    final response = await http.get(Uri.parse(_disCoverMoviesUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'] as List;
      return data.map((movie) => Movies.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load data");
    }
  }
}
