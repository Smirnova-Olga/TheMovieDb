import 'package:flutter/material.dart';
import 'package:themoviedb/Library/Widgets/Inherited/provider.dart';
import 'package:themoviedb/ui/widgets/app/my_app_model.dart';
import 'package:themoviedb/ui/widgets/tv_shows_details/tv_shows_details_main_info_widget.dart';
import 'package:themoviedb/ui/widgets/tv_shows_details/tv_shows_details_main_screen_cast_widget.dart';
import 'package:themoviedb/ui/widgets/tv_shows_details/tv_shows_details_model.dart';

class TvShowsDetailsWidget extends StatefulWidget {
  const TvShowsDetailsWidget({
    super.key,
  });

  @override
  State<TvShowsDetailsWidget> createState() => _TvShowsDetailsWidgetState();
}

class _TvShowsDetailsWidgetState extends State<TvShowsDetailsWidget> {
  @override
  void initState() {
    super.initState();
    final model = NotifierProvider.read<TvShowsDetailsModel>(context);
    final appModel = Provider.read<MyAppModel>(context);
    model?.onSessionExpired = () => appModel?.resetSession(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    NotifierProvider.read<TvShowsDetailsModel>(context)?.setupLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _TitleWidget(),
      ),
      body: const ColoredBox(
        color: Color.fromRGBO(24, 23, 27, 1.0),
        child: _BodyWidget(),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TvShowsDetailsModel>(context);
    return Text(model?.tvShowsDetails?.name ?? 'Загрузка...');
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TvShowsDetailsModel>(context);
    final tvShowsDetails = model?.tvShowsDetails;
    if (tvShowsDetails == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView(
      children: const [
        TvShowsDetailsMainInfoWidget(),
        SizedBox(height: 30),
        TvShowsDetailsMainScreenCastWidget(),
      ],
    );
  }
}
