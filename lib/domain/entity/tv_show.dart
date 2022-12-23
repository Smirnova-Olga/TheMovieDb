// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'tv_show.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TvShow {
  final String? posterPath;
  final double popularity;
  final int id;
  final String? backdropPath;
  final double voteAverage;
  final String overview;
  @JsonKey(fromJson: _parseDateFromString)
  final DateTime? firstAirDate;
  final List<String> originCountry;
  final List<int> genre_ids;
  final String originalLanguage;
  final int voteCount;
  final String name;
  final String originalName;

  TvShow({
    required this.posterPath,
    required this.popularity,
    required this.id,
    required this.backdropPath,
    required this.voteAverage,
    required this.overview,
    required this.firstAirDate,
    required this.originCountry,
    required this.genre_ids,
    required this.originalLanguage,
    required this.voteCount,
    required this.name,
    required this.originalName,
  });

  factory TvShow.fromJson(Map<String, dynamic> json) => _$TvShowFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowToJson(this);

  static DateTime? _parseDateFromString(String? rawDate) {
    if (rawDate == null || rawDate.isEmpty) return null;
    return DateTime.tryParse(rawDate);
  }
}
