class PersonDetail {
  final String? birthday;
  final String? knownForDepartment;
  final String? deathday;
  final int id;
  final String name;
  final List<String>? alsoKnownAs;
  final int gender;
  final String? biography;
  final double popularity;
  final String? placeOfBirth;
  final String? profilePath;
  final bool adult;

  PersonDetail({
    this.birthday,
    this.knownForDepartment,
    this.deathday,
    required this.id,
    required this.name,
    this.alsoKnownAs,
    required this.gender,
    this.biography,
    required this.popularity,
    this.placeOfBirth,
    this.profilePath,
    required this.adult,
  });

  static PersonDetail fromMap(Map<dynamic, dynamic> map) => PersonDetail(
        birthday: map['birthday'] as String?,
        knownForDepartment: map['known_for_department'] as String?,
        deathday: map['deathday'] as String?,
        id: map['id'] as int,
        name: map['name'] as String,
        alsoKnownAs: (map['also_known_as'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
        gender: map['gender'] as int,
        biography: map['biography'] as String?,
        popularity: map['popularity'] as double,
        placeOfBirth: map['place_of_birth'] as String?,
        profilePath: map['profile_path'] as String?,
        adult: map['adult'] as bool,
      );
}
