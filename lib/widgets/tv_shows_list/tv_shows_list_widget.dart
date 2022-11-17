import 'package:flutter/material.dart';
import 'package:themoviedb/images.dart';

class TvShows {
  final int id;
  final AssetImage imageName;
  final String title;
  final String time;
  final String description;

  TvShows({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class TvShowsListWidget extends StatefulWidget {
  const TvShowsListWidget({super.key});

  @override
  State<TvShowsListWidget> createState() => _TvShowsListWidgetState();
}

class _TvShowsListWidgetState extends State<TvShowsListWidget> {
  final _tvShows = [
    TvShows(
      id: 8,
      imageName: AppImages.rickimorti,
      title: 'Рик и Морти',
      time: '2022',
      description:
          'В центре сюжета — школьник по имени Морти и его дедушка Рик. Морти — самый обычный мальчик, который ничем не отличается от своих сверстников. А вот его дедуля занимается необычными научными исследованиями и зачастую полностью неадекватен. Он может в любое время дня и ночи схватить внука и отправиться вместе с ним в межпространственные приключения с помощью построенной из разного хлама летающей тарелки, которая способна перемещаться сквозь временной тоннель. Каждый раз эта парочка оказывается в самых неожиданных местах и самых нелепых ситуациях.',
    ),
    TvShows(
      id: 14,
      imageName: AppImages.anatomy,
      title: 'Анатомия страсти ',
      time: '30 мар 2005',
      description:
          'В центре событий — молодая женщина-хирург Мередит Грей, дочь известного врача Эллис Грей. Она работает в городской больнице Сиэтла, и её коллеги, такие же начинающие врачи, как она. Хирурги оперируют и влюбляются, заводят истории болезни и служебные романы, хранят свои врачебные тайны, борются с осложнениями у пациентов и в собственной личной жизни. И зачастую отношения с противоположным полом волнуют их не меньше, чем вопрос приобретения ими профессионального опыта.',
    ),
    TvShows(
      id: 15,
      imageName: AppImages.domdracona,
      title: 'Дом Дракона',
      time: '21 авг 2022',
      description:
          'Члены дома Таргариенов оставляют обречённую Валирию и отправляются на запад, где обнаруживают огромную территорию, населённую враждующими королевствами.',
    ),
  ];
  var _filteredTvShows = <TvShows>[];

  final _searchController = TextEditingController();

  void _searchTvShows() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredTvShows = _tvShows.where((TvShows tvShow) {
        return tvShow.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    if (query.isEmpty) {
      _filteredTvShows = _tvShows;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredTvShows = _tvShows;
    _searchController.addListener(_searchTvShows);
  }

  void _onTvShowTap(int index) {
    final id = _tvShows[index].id;
    Navigator.of(context).pushNamed(
      '/main_screen/tv_shows_details',
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 70.0),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredTvShows.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final movie = _filteredTvShows[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image(image: movie.imageName),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                movie.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                movie.time,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                movie.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => _onTvShowTap(index),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Поиск',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
