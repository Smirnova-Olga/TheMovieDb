import 'package:json_annotation/json_annotation.dart';

part 'tv_shows_details_videos.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvShowsDetailsVideos {
  final List<TvShowsDetailsVideosResult> results;
  TvShowsDetailsVideos({
    required this.results,
  });

  factory TvShowsDetailsVideos.fromJson(Map<String, dynamic> json) =>
      _$TvShowsDetailsVideosFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowsDetailsVideosToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvShowsDetailsVideosResult {
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String publishedAt;
  final String id;
  TvShowsDetailsVideosResult({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });
  factory TvShowsDetailsVideosResult.fromJson(Map<String, dynamic> json) =>
      _$TvShowsDetailsVideosResultFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowsDetailsVideosResultToJson(this);
}
