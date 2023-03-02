// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:themoviedb/Library/Widgets/Inherited/provider.dart';
import 'package:themoviedb/domain/api_client/image_downloader.dart';
import 'package:themoviedb/ui/navigation/main_navigation.dart';
import 'package:themoviedb/ui/widgets/elements/radius_score.dart';
import 'package:themoviedb/ui/widgets/tv_shows_details/tv_shows_details_model.dart';

class TvShowsDetailsMainInfoWidget extends StatelessWidget {
  const TvShowsDetailsMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _TopPosterWidget(),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: _TvShowNameWidget(),
        ),
        const _ScoreWidget(),
        const _SummeryWidget(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _overviewWidget(),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: _DescriptionWidget(),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Text _overviewWidget() {
    return const Text(
      'Overview',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TvShowsDetailsModel>(context);
    return Text(
      model?.tvShowsDetails?.overview ?? '',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TvShowsDetailsModel>(context);
    final backdropPath = model?.tvShowsDetails?.backdropPath;
    final posterPath = model?.tvShowsDetails?.posterPath;
    return AspectRatio(
      aspectRatio: 390 / 219,
      child: Stack(
        children: [
          backdropPath != null
              ? Image.network(ImageDownloader.imageUrl(backdropPath))
              : const SizedBox.shrink(),
          Positioned(
            top: 20,
            left: 20,
            bottom: 20,
            child: posterPath != null
                ? Image.network(ImageDownloader.imageUrl(posterPath))
                : const SizedBox.shrink(),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: IconButton(
              icon: Icon(model?.isFavorite == true
                  ? Icons.favorite
                  : Icons.favorite_outline),
              onPressed: () => model?.toggleFavorite(),
            ),
          ),
        ],
      ),
    );
  }
}

class _TvShowNameWidget extends StatelessWidget {
  const _TvShowNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TvShowsDetailsModel>(context);
    var year = model?.tvShowsDetails?.firstAirDate?.year.toString();
    year = year != null ? ' ($year)' : '';
    return Center(
      child: RichText(
        maxLines: 3,
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: model?.tvShowsDetails?.name ?? '',
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: year,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tvShowsDetails =
        NotifierProvider.watch<TvShowsDetailsModel>(context)?.tvShowsDetails;
    var voteAverage = tvShowsDetails?.voteAverage ?? 0;
    final videos = tvShowsDetails?.videos.results
        .where((video) => video.type == 'Trailer' && video.site == 'YouTube');
    final trailerKey = videos?.isNotEmpty == true ? videos?.first.key : null;
    voteAverage = voteAverage * 10;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: RadiusScoreWidget(
                  percent: voteAverage / 100,
                  fillColor: Colors.black,
                  lineColor: Colors.green,
                  freeColor: Colors.blueGrey,
                  lineWidth: 3,
                  child: Text('${voteAverage.toStringAsFixed(0)}%'),
                ),
              ),
              const SizedBox(width: 10),
              const Text('User Score'),
            ],
          ),
        ),
        Container(
          width: 1,
          height: 15,
          color: Colors.grey,
        ),
        trailerKey != null
            ? TextButton(
                onPressed: () => Navigator.of(context).pushNamed(
                  MainNavigationRouteNames.movieTrailerWidget,
                  arguments: trailerKey,
                ),
                child: Row(
                  children: const [
                    Icon(Icons.play_arrow),
                    Text('Play Trailer'),
                  ],
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TvShowsDetailsModel>(context);
    if (model == null) return const SizedBox.shrink();
    var texts = <String>[];

    final genres = model.tvShowsDetails?.genres;
    if (genres != null && genres.isNotEmpty) {
      var genresNames = <String>[];
      for (var genr in genres) {
        genresNames.add(genr.name);
      }
      texts.add(genresNames.join(', '));
    }

    return ColoredBox(
      color: const Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 65,
        ),
        child: Text(
          texts.join(' '),
          maxLines: 3,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
