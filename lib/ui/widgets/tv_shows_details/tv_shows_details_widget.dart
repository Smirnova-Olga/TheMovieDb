import 'package:flutter/material.dart';
import 'package:themoviedb/ui/widgets/tv_shows_details/tv_shows_details_main_info_widget.dart';
import 'package:themoviedb/ui/widgets/tv_shows_details/tv_shows_details_main_screen_cast_widget.dart';

class TvShowsDetailsWidget extends StatefulWidget {
  final int tvShowId;
  const TvShowsDetailsWidget({
    super.key,
    required this.tvShowId,
  });

  @override
  State<TvShowsDetailsWidget> createState() => _TvShowsDetailsWidgetState();
}

class _TvShowsDetailsWidgetState extends State<TvShowsDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Соник 2 в кино'),
      ),
      body: ColoredBox(
        color: const Color.fromRGBO(24, 23, 27, 1.0),
        child: ListView(
          children: const [
            TvShowsDetailsMainInfoWidget(),
            TvShowsDetailsMainScreenCastWidget(),
          ],
        ),
      ),
    );
  }
}
