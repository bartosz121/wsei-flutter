class Credits {
  final int id;
  final List<CastMember> cast;
  final List<CrewMember> crew;

  Credits({
    required this.id,
    required this.cast,
    required this.crew,
  });

  static Credits fromMap(Map<String, dynamic> map) {
    return Credits(
      id: map['id'],
      cast: List<Map<String, dynamic>>.from(map['cast'])
          .map((castMap) => CastMember.fromMap(castMap))
          .toList(),
      crew: List<Map<String, dynamic>>.from(map['crew'])
          .map((crewMap) => CrewMember.fromMap(crewMap))
          .toList(),
    );
  }
}

class CastMember {
  final int id;
  final String name;
  final String character;
  final String? profilePath;

  CastMember({
    required this.id,
    required this.name,
    required this.character,
    this.profilePath,
  });

  static CastMember fromMap(Map<String, dynamic> map) {
    return CastMember(
      id: map['id'],
      name: map['name'],
      character: map['character'],
      profilePath: map['profile_path'],
    );
  }
}

class CrewMember {
  final int id;
  final String name;
  final String department;
  final String job;
  final String? profilePath;

  CrewMember({
    required this.id,
    required this.name,
    required this.department,
    required this.job,
    this.profilePath,
  });

  static CrewMember fromMap(Map<String, dynamic> map) {
    return CrewMember(
      id: map['id'],
      name: map['name'],
      department: map['department'],
      job: map['job'],
      profilePath: map['profile_path'],
    );
  }
}
