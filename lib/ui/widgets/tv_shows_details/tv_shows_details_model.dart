import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:themoviedb/domain/api_client/api_client.dart';
import 'package:themoviedb/domain/entity/tv_shows_details.dart';

class TvShowsDetailsModel extends ChangeNotifier {
  final _apiClient = ApiClient();

  final int tvShowId;
  TvShowsDetails? _tvShowsDetails;
  String _locale = '';
  late DateFormat _dateFormat;

  TvShowsDetails? get tvShowsDetails => _tvShowsDetails;

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
    _tvShowsDetails = await _apiClient.tvShowsDetails(tvShowId, _locale);
    notifyListeners();
  }
}
