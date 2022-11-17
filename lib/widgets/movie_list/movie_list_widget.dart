import 'package:flutter/material.dart';
import '../../images.dart';

class Movie {
  final int id;
  final AssetImage imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => MovieListWidgetState();
}

class MovieListWidgetState extends State<MovieListWidget> {
  final movies = [
    Movie(
      id: 1,
      imageName: AppImages.sonik,
      title: 'Соник 2 в кино',
      time: '30 мар 2022',
      description:
          'Поселившись в Грин Хилз, Соник стремится доказать, что у него есть все задатки настоящего героя. И геройское испытание не заставляет себя долго ждать: злодейский доктор Роботник вновь строит козни. На этот раз — с загадочным напарником Наклзом. Вместе они разыскивают бесценный изумруд, в котором заключены силы, способные уничтожать целые цивилизации. Соник объединяется с лисенком Тейлзом, чтобы отправиться в кругосветное путешествие и найти изумруд до того, как он попадет в плохие руки.',
    ),
    Movie(
      id: 2,
      imageName: AppImages.superpitomcy,
      title: 'Суперпитомцы',
      time: '29 июля 2022',
      description:
          'Пес Крипто — лучший друг Супермена, обладающий такими же внеземными способностями, как и его хозяин. Вместе они отважно борются с преступностью в Метрополисе. Но когда Супермена и других членов Лиги справедливости похищают неизвестные злодеи, Крипто приходится подготовить новых помощников, а именно разношерстную компанию животных из приюта, которые неожиданно обрели суперсилу. Сможет ли пушистая Лига суперпитомцев спасти Супермена, а заодно и весь мир?',
    ),
    Movie(
      id: 3,
      imageName: AppImages.korolevaUga,
      title: 'Королева Юга',
      time: '18 окт 2022',
      description:
          'Тереса покидает Мексику после того, как убивают её приятеля-наркокурьера. Обосновавшись в Испании, она стремится стать всевластным в стране контрабандистом наркотиков и отомстить за смерть своего любовника.',
    ),
    Movie(
      id: 4,
      imageName: AppImages.hulk,
      title: 'She-Hulk: Attorney at Law',
      time: '18 авг 2022',
      description:
          'Дженнифер Уолтерс – юрист по делам о сверхлюдях и двоюродная сестра Брюса Беннера – Халка. Она пытается справиться со сложностями на работе, в личной жизни и со своей супергеройской личностью в лице Женщины-Халка.',
    ),
    Movie(
      id: 5,
      imageName: AppImages.lou,
      title: 'Лу',
      time: '23 сент 2022',
      description:
          'Фильм «Лу» про знаменитую охотницу за головами, которая выходит на пенсию. Она решает начать спокойную и размеренную жизнь, где не будет места для расследований и перестрелок. Вспомнить о прежних деяниях приходится после того, как на пороге дома Лу появляется неизвестная женщина. Она умоляет ее помочь, ведь ей попросту не к кому больше обратиться. Мстительнице приходится согласиться. Больше ей нечего терять, все ее родные и близкие давно мертвы, но любовь не становится для нее чуждым ощущением.',
    ),
    Movie(
      id: 6,
      imageName: AppImages.doctorStrendzh,
      title: 'Доктор Стрэндж: В мультивселенной безумия',
      time: '08 сент 2022',
      description:
          'Сверчок Джимини забирается в дом старого столяра Джеппетто, который заканчивает работу над деревянной куклой-марионеткой Пиноккио. Перед сном сверчок загадывает желание, чтобы Пиноккио стал живым мальчиком.',
    ),
    Movie(
      id: 7,
      imageName: AppImages.pinokkio,
      title: 'Пиноккио',
      time: '30 мар 2022',
      description:
          'Поселившись в Грин Хилз, Соник стремится доказать, что у него есть все задатки настоящего героя. И геройское испытание не заставляет себя долго ждать: злодейский доктор Роботник вновь строит козни. На этот раз — с загадочным напарником Наклзом. Вместе они разыскивают бесценный изумруд, в котором заключены силы, способные уничтожать целые цивилизации. Соник объединяется с лисенком Тейлзом, чтобы отправиться в кругосветное путешествие и найти изумруд до того, как он попадет в плохие руки.',
    ),
    Movie(
      id: 8,
      imageName: AppImages.rickimorti,
      title: 'Рик и Морти',
      time: '2022',
      description:
          'В центре сюжета — школьник по имени Морти и его дедушка Рик. Морти — самый обычный мальчик, который ничем не отличается от своих сверстников. А вот его дедуля занимается необычными научными исследованиями и зачастую полностью неадекватен. Он может в любое время дня и ночи схватить внука и отправиться вместе с ним в межпространственные приключения с помощью построенной из разного хлама летающей тарелки, которая способна перемещаться сквозь временной тоннель. Каждый раз эта парочка оказывается в самых неожиданных местах и самых нелепых ситуациях.',
    ),
    Movie(
      id: 9,
      imageName: AppImages.spyfamily,
      title: 'Семья шпиона',
      time: '2022',
      description:
          'У каждого есть свои секреты... Наступила эпоха, когда мировые державы были втянуты в беспощадную информационную войну, скрытую от глаз простых людей. Восток (Остания) и Запад (Вестерис) ведут такую войну уже многие годы. Ллойд Форджер — профессиональный шпион под кодовым именем Сумрак получает особое задание от командования, целью которого является поддержание мира между двумя сверхдержавами. В качестве прикрытия он обязан обзавестись фиктивной семьёй. Роль условной жены досталась не кому-то, а известной наёмной убийце под псевдонимом Тернистая Принцесса, однако это показалось командованию недостаточным, и он удочеряет шестилетнюю девочку-эспера, которая может читать мысли других людей. Теперь новой семье предстоит не только выполнить секретное задание, не раскрыв себя, но и понять, что семья — это гораздо больше, чем просто кровные родственники',
    ),
    Movie(
      id: 10,
      imageName: AppImages.chaki,
      title: 'Чаки',
      time: '2021',
      description:
          'Винтажные куклы всегда пользуются большим спросом. Они хранят в себе немало тайн и загадок. И 14-летний парень Джейк Уэббер об этом прекрасно знает. Увидев на распродаже старую куклу «хорошего парня» по имени Чаки, герой сериала решает приобрести находку.',
    ),
    Movie(
      id: 11,
      imageName: AppImages.tor,
      title: 'Тор: Любовь и гром',
      time: '08 июля 2022',
      description:
          'Тор  отправляется в путешествие, не похожее ни на что из того, с чем он когда-либо сталкивался, — в поисках внутреннего спокойствия. Но его выход на пенсию прерывается Горром Убийцей богов, который стремится уничтожить богов. Чтобы справиться с угрозой, Тор обращается за помощью к Валькирии, Коргу и бывшей подруге Джейн Фостер, которая, к удивлению Тора, необъяснимым образом владеет своим волшебным молотом Мьёльниром. Вместе они отправляются в душераздирающее космическое приключение, чтобы раскрыть тайну Горра и остановить его, пока не стало слишком поздно.',
    ),
    Movie(
      id: 12,
      imageName: AppImages.focuspocus2,
      title: 'Фокус-покус 2',
      time: '30 сент 2022',
      description:
          'Три девушки объединяются, чтобы остановить сестёр Сандерсон, которые вернулись в современный Салем 29 лет спустя.',
    ),
    Movie(
      id: 13,
      imageName: AppImages.scoobydoo,
      title: 'Скуби-Ду: Шалость или сладость ',
      time: '2022',
      description:
          'Команда корпорации "Тайна" превзошла саму себя! Ребята выследили и посадили за решетку Коко Дьябло, главу печально известного преступного синдиката. Фрэд, Дафна, Велма, Шэгги и Скуби предвкушают долгожданную передышку, но не тут-то было. На фестивале в Кулсвилле объявляются двойники главных героев, и теперь им предстоит объединиться с Коко, чтобы разгадать эту загадку.',
    ),
    Movie(
      id: 14,
      imageName: AppImages.anatomy,
      title: 'Анатомия страсти ',
      time: '30 мар 2005',
      description:
          'В центре событий — молодая женщина-хирург Мередит Грей, дочь известного врача Эллис Грей. Она работает в городской больнице Сиэтла, и её коллеги, такие же начинающие врачи, как она. Хирурги оперируют и влюбляются, заводят истории болезни и служебные романы, хранят свои врачебные тайны, борются с осложнениями у пациентов и в собственной личной жизни. И зачастую отношения с противоположным полом волнуют их не меньше, чем вопрос приобретения ими профессионального опыта.',
    ),
    Movie(
      id: 15,
      imageName: AppImages.domdracona,
      title: 'Дом Дракона',
      time: '21 авг 2022',
      description:
          'Члены дома Таргариенов оставляют обречённую Валирию и отправляются на запад, где обнаруживают огромную территорию, населённую враждующими королевствами.',
    ),
  ];
  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    if (query.isEmpty) {
      _filteredMovies = movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = movies;
    _searchController.addListener(_searchMovies);
  }

  void onMovieTap(int index) {
    final id = movies[index].id;
    Navigator.of(context).pushNamed(
      '/main_screen/movie_details',
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
          itemCount: _filteredMovies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final movie = _filteredMovies[index];
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
                      onTap: () => onMovieTap(index),
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
