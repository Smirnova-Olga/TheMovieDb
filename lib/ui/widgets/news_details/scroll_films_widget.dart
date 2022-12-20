import 'package:flutter/material.dart';

import 'package:themoviedb/resources/resources.dart';
import 'package:themoviedb/ui/widgets/elements/dropdown_sort_button.dart';
import 'package:themoviedb/ui/widgets/elements/radius_score.dart';

class MovieSideScrollWidget extends StatelessWidget {
  const MovieSideScrollWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Scrollbar(
        child: ListView.builder(
          itemCount: 20,
          itemExtent: 120,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              clipBehavior: Clip.hardEdge,
                              child: const Image(
                                image: AssetImage(AppImages.domdracona),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: SizedBox(
                                width: 104,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Дом дракона',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      '21 авг 2022',
                                      maxLines: 4,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Positioned(
                          top: 139,
                          left: 10,
                          width: 33,
                          height: 33,
                          child: RadiusScoreWidget(
                            percent: 0.15,
                            fillColor: Colors.black,
                            lineColor: Colors.green,
                            freeColor: Colors.blueGrey,
                            lineWidth: 3,
                            child: Text(
                              '15%',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 9,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 65,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.density_medium_outlined,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SortViewWidget extends StatelessWidget {
  final String titleText;
  final String buttonText;

  const SortViewWidget({
    Key? key,
    required this.titleText,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            titleText,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 5),
          const DropdownSortButton(),
        ],
      ),
    );
  }
}
