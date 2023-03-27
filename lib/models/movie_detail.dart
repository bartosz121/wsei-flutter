class MovieDetail {
  final bool adult;
  String? backdropPath;
  final int budget;
  final List<Genres> genres;
  String? homepage;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  String? overview;
  final double popularity;
  String? posterPath;
  final List<ProductionCompanies> productionCompanies;
  final List<ProductionCountries> productionCountries;
  String? releaseDate;
  final int revenue;
  int? runtime;
  final List<SpokenLanguages> spokenLanguages;
  final String status;
  String? tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieDetail(
      {required this.adult,
      this.backdropPath,
      required this.budget,
      required this.genres,
      this.homepage,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      this.overview,
      required this.popularity,
      this.posterPath,
      required this.productionCompanies,
      required this.productionCountries,
      this.releaseDate,
      required this.revenue,
      this.runtime,
      required this.spokenLanguages,
      required this.status,
      this.tagline,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});

  static MovieDetail fromMap(Map<dynamic, dynamic> map) => MovieDetail(
        adult: map['adult'] as bool,
        backdropPath: map['backdrop_path'] as String?,
        budget: map['budget'] as int,
        genres: (map['genres'] as List<dynamic>?)
                ?.map((e) => Genres.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        homepage: map['homepage'] as String?,
        id: map['id'] as int,
        originalLanguage: map['original_language'] as String,
        originalTitle: map['original_title'] as String,
        overview: map['overview'] as String?,
        popularity: map['popularity'] as double,
        posterPath: map['poster_path'] as String?,
        productionCompanies: (map['production_companies'] as List<dynamic>?)
                ?.map((e) =>
                    ProductionCompanies.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        productionCountries: (map['production_countries'] as List<dynamic>?)
                ?.map((e) =>
                    ProductionCountries.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        releaseDate: map['release_date'] as String?,
        revenue: map['revenue'] as int,
        runtime: map['runtime'] as int?,
        spokenLanguages: (map['spoken_languages'] as List<dynamic>?)
                ?.map(
                    (e) => SpokenLanguages.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        status: map['status'] as String,
        tagline: map['tagline'] as String?,
        title: map['title'] as String,
        video: map['video'] as bool,
        voteAverage: map['vote_average'] as double,
        voteCount: map['vote_count'] as int,
      );
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class ProductionCompanies {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo_path'] = this.logoPath;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    return data;
  }
}

class ProductionCountries {
  String? iso31661;
  String? name;

  ProductionCountries({this.iso31661, this.name});

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_3166_1'] = this.iso31661;
    data['name'] = this.name;
    return data;
  }
}

class SpokenLanguages {
  String? iso6391;
  String? name;

  SpokenLanguages({this.iso6391, this.name});

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_639_1'] = this.iso6391;
    data['name'] = this.name;
    return data;
  }
}
