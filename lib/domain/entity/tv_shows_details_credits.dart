import 'package:json_annotation/json_annotation.dart';

part 'tv_shows_details_credits.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvShowsDetailsCredits {
  final List<Actor> cast;
  final List<Employee> crew;

  TvShowsDetailsCredits({
    required this.cast,
    required this.crew,
  });
  factory TvShowsDetailsCredits.fromJson(Map<String, dynamic> json) =>
      _$TvShowsDetailsCreditsFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowsDetailsCreditsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Actor {
  final bool adult;
  final int? gender;
  final int? id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final String character;
  final String? creditId;
  final int? order;
  Actor({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.character,
    required this.creditId,
    required this.order,
  });
  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);

  Map<String, dynamic> toJson() => _$ActorToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Employee {
  final bool adult;
  final int? gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final String creditId;
  final String department;
  final String job;
  Employee({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.creditId,
    required this.department,
    required this.job,
  });
  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}

// @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
// class ProfilePath {
//   ProfilePath();
//   factory ProfilePath.fromJson(Map<String, dynamic> json) =>
//       _$ProfilePathFromJson(json);

//   Map<String, dynamic> toJson() => _$ProfilePathToJson(this);
// }
