// ignore_for_file: unused_element

import 'package:flutter/material.dart';

import 'package:themoviedb/widgets/news_details/scroll_films_widget.dart';
import 'package:themoviedb/widgets/news_details/top_poster_widget.dart';

class NewsDetailsWidget extends StatelessWidget {
  const NewsDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          TopPosterWidget(),
          SizedBox(
            height: 5,
          ),
          SortViewWidget(titleText: 'Что популярно', buttonText: 'Онлайн'),
          SizedBox(
            height: 5,
          ),
          MovieSideScrollWidget(),
          SizedBox(
            height: 25,
          ),
          SortViewWidget(titleText: 'Бесплатное', buttonText: 'Фильмы'),
          SizedBox(
            height: 5,
          ),
          MovieSideScrollWidget(),
        ],
      ),
    );
  }
}
