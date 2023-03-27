class TrendingMovie {
  final bool adult;
  String? backdropPath;
  final int id;
  final String title;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  String? posterPath;
  final String mediaType;
  final List<int> genreIds;
  final double popularity;
  final String releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  TrendingMovie(
      {required this.adult,
      this.backdropPath,
      required this.id,
      required this.title,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      this.posterPath,
      required this.mediaType,
      required this.genreIds,
      required this.popularity,
      required this.releaseDate,
      required this.video,
      required this.voteAverage,
      required this.voteCount});

  static TrendingMovie fromMap(Map<dynamic, dynamic> map) => TrendingMovie(
        adult: map['adult'] as bool,
        backdropPath: map['backdrop_path'] as String?,
        id: map['id'] as int,
        title: map['title'] as String,
        originalLanguage: map['original_language'] as String,
        originalTitle: map['original_title'] as String,
        overview: map['overview'] as String,
        posterPath: map['poster_path'] as String?,
        mediaType: map['media_type'] as String,
        genreIds: (map['genre_ids'] as List<dynamic>?)
                ?.map((e) => e as int)
                .toList() ??
            [],
        popularity: map['popularity'] as double,
        releaseDate: map['release_date'] as String,
        video: map['video'] as bool,
        voteAverage: map['vote_average'] as double,
        voteCount: map['vote_count'] as int,
      );
}
