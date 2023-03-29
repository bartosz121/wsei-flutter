import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wsei_flutter/models/trending_movie.dart';
import 'package:wsei_flutter/views/movie_details.dart';
import 'package:wsei_flutter/services/api_service.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  _MoviesViewState createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  final api = ApiService();

  late Future<List<TrendingMovie>> _movies;

  @override
  void initState() {
    super.initState();
    _movies = _fetchMovies();
  }

  Future<List<TrendingMovie>> _fetchMovies() async {
    return await api.getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: FutureBuilder<List<TrendingMovie>>(
        future: _movies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final movie = snapshot.data![index];
                return Card(
                  elevation: 5,
                  child: SizedBox(
                    width: 300,
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: () {
                                  Get.to(() => MovieDetails(movieId: movie.id),
                                      transition: Transition.fade,
                                      duration: const Duration(seconds: 1));
                                },
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                  fit: BoxFit.cover,
                                  width: 150,
                                ))),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  movie.overview,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error fetching movies'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
