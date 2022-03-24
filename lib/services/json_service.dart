import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dynamic_link_app/model/movies_model.dart';

class JsonService
{
  // for movies
  static List<MoviesModel> movies = [];
  static Future<List<MoviesModel>> readMoviesData() async {
    return rootBundle.loadString("assets/movies.json").then((value) {
      movies = moviesModelFromJson(value);
      if (kDebugMode) {
        print("movies are $movies");
      }
      return movies;

    });
  }
}