import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:themoviedb/domain/api_client/account_api_client.dart';
import 'package:themoviedb/domain/api_client/tv_show_api_client.dart';
import 'package:themoviedb/domain/api_client/api_client_exception.dart';
import 'package:themoviedb/domain/data_providers/session_data_provider.dart';
import 'package:themoviedb/domain/entity/tv_shows_details.dart';

class TvShowsDetailsModel extends ChangeNotifier {
  final _sessionDataProvider = SessionDataProvider();
  final _tvShowApiClient = TvShowApiClient();
  final _accountApiClient = AccountApiClient();
  final int tvShowId;
  TvShowsDetails? _tvShowsDetails;
  bool _isFavorite = false;
  String _locale = '';
  late DateFormat _dateFormat;
  Future<void>? Function()? onSessionExpired;

  TvShowsDetails? get tvShowsDetails => _tvShowsDetails;
  bool get isFavorite => _isFavorite;

  TvShowsDetailsModel(this.tvShowId);

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMMd(locale);
    await loadDetails();
  }

  Future<void> loadDetails() async {
    try {
      _tvShowsDetails =
          await _tvShowApiClient.tvShowsDetails(tvShowId, _locale);
      final sessionId = await _sessionDataProvider.getSessionId();
      if (sessionId != null) {
        _isFavorite =
            await _tvShowApiClient.isFavoriteTvShow(tvShowId, sessionId);
      }
      notifyListeners();
    } on ApiClientException catch (e) {
      _handleApiClientException(e);
    }
  }

  Future<void> toggleFavorite() async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final accountId = await _sessionDataProvider.getAccountId();

    if (sessionId == null || accountId == null) return;

    _isFavorite = !_isFavorite;
    notifyListeners();
    try {
      await _accountApiClient.markAsFavorite(
        accountId: accountId,
        sessionId: sessionId,
        mediaType: MediaType.tvShow,
        mediaId: tvShowId,
        isFavorite: _isFavorite,
      );
    } on ApiClientException catch (e) {
      _handleApiClientException(e);
    }
  }

  void _handleApiClientException(ApiClientException exeption) {
    switch (exeption.type) {
      case ApiClientExceptionType.sessionExpired:
        onSessionExpired?.call();
        break;
      default:
        print(exeption);
    }
  }
}
