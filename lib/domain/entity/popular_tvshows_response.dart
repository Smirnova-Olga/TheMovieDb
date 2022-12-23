import 'package:json_annotation/json_annotation.dart';
import 'package:themoviedb/domain/entity/tv_show.dart';

part 'popular_tvshows_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PopularTvShowsResponse {
  final int page;
  @JsonKey(name: 'results')
  final List<TvShow> tvShows;
  final int totalResults;
  final int totalPages;

  PopularTvShowsResponse({
    required this.page,
    required this.tvShows,
    required this.totalResults,
    required this.totalPages,
  });

  factory PopularTvShowsResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularTvShowsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PopularTvShowsResponseToJson(this);
}
