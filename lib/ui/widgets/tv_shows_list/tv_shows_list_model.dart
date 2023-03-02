import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:themoviedb/domain/api_client/tv_show_api_client.dart';
import 'package:themoviedb/domain/entity/popular_tvshows_response.dart';
import 'package:themoviedb/domain/entity/tv_show.dart';
import 'package:themoviedb/ui/navigation/main_navigation.dart';

class TvShowsListModel extends ChangeNotifier {
  final _apiClient = TvShowApiClient();
  final _tvShows = <TvShow>[];
  late int _currentPage;
  late int _totalPage;
  var _isLoadingInProgres = false;
  String? _searchQuery;
  String _locale = '';
  Timer? searchDeboubce;

  List<TvShow> get tvShows => List.unmodifiable(_tvShows);
  late DateFormat _dateFormat;

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMMd(locale);
    await _resetList();
  }

  Future<void> _resetList() async {
    _currentPage = 0;
    _totalPage = 1;
    _tvShows.clear();
    await _loadNextPage();
  }

  Future<PopularTvShowsResponse> _loadTvShows(
      int nextPage, String locale) async {
    final query = _searchQuery;
    if (query == null) {
      return await _apiClient.popularTvShows(nextPage, _locale);
    } else {
      return await _apiClient.searchTvShows(nextPage, locale, query);
    }
  }

  Future<void> _loadNextPage() async {
    if (_isLoadingInProgres || _currentPage >= _totalPage) return;
    _isLoadingInProgres = true;
    final nextPage = _currentPage + 1;

    try {
      final tvShowsResponse = await _loadTvShows(nextPage, _locale);
      _tvShows.addAll(tvShowsResponse.tvShows);
      _currentPage = tvShowsResponse.page;
      _totalPage = tvShowsResponse.totalPages;
      _isLoadingInProgres = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgres = false;
    }
  }

  void onTvShowTap(BuildContext context, int index) {
    final id = _tvShows[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.tvShowsDetails,
      arguments: id,
    );
  }

  Future<void> serachTvShow(String text) async {
    searchDeboubce?.cancel();
    searchDeboubce = Timer(const Duration(milliseconds: 300), () async {
      final searchQuery = text.isNotEmpty ? text : null;
      if (_searchQuery == searchQuery) return;
      _searchQuery = searchQuery;
      await _resetList();
    });
  }

  void showedTvShowsAtIndex(int index) {
    if (index < _tvShows.length - 1) return;
    _loadNextPage();
  }
}
