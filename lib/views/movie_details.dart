import 'package:flutter/material.dart';
import 'package:wsei_flutter/models/movie_credits.dart';
import 'package:wsei_flutter/models/movie_detail.dart';
import 'package:wsei_flutter/views/person_details.dart';
import 'package:wsei_flutter/services/api_service.dart';

class MovieDetails extends StatefulWidget {
  final int movieId;

  const MovieDetails({Key? key, required this.movieId}) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  final api = ApiService();
  late Future<MovieDetail> _movieDetail;
  late Future<Credits> _movieCredits;

  @override
  void initState() {
    super.initState();
    _movieDetail = _fetchMovieDetails();
    _movieCredits = _fetchMovieCredits();
  }

  Future<MovieDetail> _fetchMovieDetails() async {
    return await api.getMovieDetails(widget.movieId);
  }

  Future<Credits> _fetchMovieCredits() async {
    return await api.getMovieCredits(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
      ),
      body: FutureBuilder(
        future: Future.wait([_movieDetail, _movieCredits]),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final MovieDetail movieDetails = snapshot.data[0];
          final Credits movieCredits = snapshot.data[1];

          return Column(
            children: [
              Expanded(
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${movieDetails.posterPath}',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieDetails.title,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.yellow),
                          const SizedBox(width: 8.0),
                          Text(
                            '${movieDetails.voteAverage} (${movieDetails.voteCount} votes)',
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Overview',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            movieDetails.overview ?? '',
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Cast',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      SizedBox(
                        height: 170.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movieCredits.cast.length,
                          itemBuilder: (BuildContext context, int index) {
                            final CastMember castMember =
                                movieCredits.cast[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PersonDetailsView(
                                        personId: castMember.id,
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      height: 120.0,
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500/${castMember.profilePath}',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      castMember.name,
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      castMember.character,
                                      style: const TextStyle(fontSize: 14.0),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
