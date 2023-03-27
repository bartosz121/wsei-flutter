import 'dart:convert';

import 'package:wsei_flutter/models/movie_search.dart';
import 'package:wsei_flutter/models/movie_detail.dart';
import 'package:wsei_flutter/models/movie_credits.dart';
import 'package:wsei_flutter/models/person_detail.dart';
import 'package:wsei_flutter/models/trending_movie.dart';
import 'package:wsei_flutter/utils/constants.dart';

import 'package:http/http.dart' as http;

class ApiService {
  static const endpoint = Constants.baseUrl;

  var client = http.Client();

  Future<List<TrendingMovie>> getTrendingMovies() async {
    final movies = <TrendingMovie>[];
    var response = await client.get(Uri.parse(
        '$endpoint/trending/movie/week?api_key=${Constants.tmdbApiKey}'));
    var parsed = json.decode(response.body);

    for (var movie in parsed['results']) {
      var m = TrendingMovie.fromMap(movie);
      movies.add(m);
    }
    return movies;
  }

  Future<MovieDetail> getMovieDetails(int movieId) async {
    var response = await client.get(Uri.parse(
        '$endpoint/movie/$movieId?api_key=${Constants.tmdbApiKey}&append_to_response=credits'));
    var parsed = json.decode(response.body);

    var movie = MovieDetail.fromMap(parsed);

    return movie;
  }

  Future<Credits> getMovieCredits(int movieId) async {
    final response = await client.get(Uri.parse(
        '$endpoint/movie/$movieId/credits?api_key=${Constants.tmdbApiKey}&append_to_response=credits'));
    final json = jsonDecode(response.body);
    var credits = Credits.fromMap(json);
    return credits;
  }

  Future<PersonDetail> getPersonDetails(int personId) async {
    final response = await client.get(Uri.parse(
        '$endpoint/person/$personId?api_key=${Constants.tmdbApiKey}'));
    final json = jsonDecode(response.body);
    var details = PersonDetail.fromMap(json);
    return details;
  }
}
