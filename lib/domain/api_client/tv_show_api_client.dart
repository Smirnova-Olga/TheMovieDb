import 'package:themoviedb/configuration/configuration.dart';
import 'package:themoviedb/domain/api_client/network_client.dart';
import 'package:themoviedb/domain/entity/popular_tvshows_response.dart';
import 'package:themoviedb/domain/entity/tv_shows_details.dart';

class TvShowApiClient {
  final _networkClient = NetworkClient();

  Future<PopularTvShowsResponse> popularTvShows(int page, String locale) async {
    PopularTvShowsResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularTvShowsResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/tv/popular',
      parser,
      <String, dynamic>{
        'api_key': Configuration.apiKey,
        'page': page.toString(),
        'language': locale,
      },
    );
    return result;
  }

  Future<bool> isFavoriteTvShow(
    int tvShowId,
    String? sessionId,
  ) async {
    bool parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final result = jsonMap['favorite'] as bool;
      return result;
    }

    final result = _networkClient.get(
      '/tv/$tvShowId/account_states',
      parser,
      <String, dynamic>{
        'api_key': Configuration.apiKey,
        'session_id': sessionId,
      },
    );
    return result;
  }

  Future<PopularTvShowsResponse> searchTvShows(
    int page,
    String locale,
    String query,
  ) async {
    PopularTvShowsResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularTvShowsResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/search/tv',
      parser,
      <String, dynamic>{
        'api_key': Configuration.apiKey,
        'page': page.toString(),
        'language': locale,
        'query': query,
        'include_adult': true.toString(),
      },
    );
    return result;
  }

  Future<TvShowsDetails> tvShowsDetails(
    int tvShowId,
    String locale,
  ) async {
    TvShowsDetails parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = TvShowsDetails.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/tv/$tvShowId',
      parser,
      <String, dynamic>{
        'append_to_response': 'credits,videos',
        'api_key': Configuration.apiKey,
        'language': locale,
      },
    );
    return result;
  }
}
