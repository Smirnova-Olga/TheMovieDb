import 'package:flutter/material.dart';
import 'package:themoviedb/domain/factories/screen_factory.dart';

import 'package:themoviedb/ui/widgets/movie_trailer/show_trailer_widget.dart';

abstract class MainNavigationRouteNames {
  static const loaderWidget = '/';
  static const auth = 'auth';
  static const mainScreen = '/main_screen';
  static const movieDetails = '/main_screen/movie_details';
  static const tvShowsDetails = '/main_screen/tv_shows_details';
  static const movieTrailerWidget =
      '/main_screen/movie_details/movie_details/trailer';
  static const tvShowsTrailerWidget =
      '/main_screen/tv_shows_details/tv_shows_details/trailer';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loaderWidget: (_) => _screenFactory.makeLoader(),
    MainNavigationRouteNames.auth: (_) => _screenFactory.makeAuth(),
    MainNavigationRouteNames.mainScreen: (_) => _screenFactory.makeMainScreen(),
  };
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.movieDetails:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeMovieDetails(movieId),
        );
      case MainNavigationRouteNames.tvShowsDetails:
        final arguments = settings.arguments;
        final tvShowId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
            builder: (_) => _screenFactory.makeTvShowsDetails(tvShowId));
      case MainNavigationRouteNames.movieTrailerWidget:
        final arguments = settings.arguments;
        final youtubeKey = arguments is String ? arguments : '';
        return MaterialPageRoute(
          builder: (_) => ShowTrailerWidget(youtubeKey: youtubeKey),
        );
      case MainNavigationRouteNames.tvShowsTrailerWidget:
        final arguments = settings.arguments;
        final youtubeKey = arguments is String ? arguments : '';
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeMovieTrailer(youtubeKey),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }

  static void resetNavigation(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      MainNavigationRouteNames.loaderWidget,
      (route) => false,
    );
  }
}
