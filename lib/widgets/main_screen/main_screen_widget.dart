import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/movie_list/movie_list_widget.dart';
import 'package:themoviedb/widgets/news_details/news_details_widget.dart';
import 'package:themoviedb/widgets/tv_shows_list/tv_shows_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  void onSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB'),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: const [
          NewsDetailsWidget(),
          MovieListWidget(),
          TvShowsListWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter),
            label: 'Films',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'TV series',
          )
        ],
        onTap: onSelectedTab,
      ),
    );
  }
}
