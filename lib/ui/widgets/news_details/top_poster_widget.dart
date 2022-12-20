import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';

class TopPosterWidget extends StatefulWidget {
  const TopPosterWidget({super.key});

  @override
  State<TopPosterWidget> createState() => _TopPosterWidgetState();
}

class _TopPosterWidgetState extends State<TopPosterWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Stack(
        children: const [
          Opacity(
            opacity: 0.5,
            child: Image(
              image: AssetImage(AppImages.sonic2Fon),
            ),
          ),
          MainTextWidget(),
          SearchWithButtonWidget(),
        ],
      ),
    );
  }
}

class MainTextWidget extends StatelessWidget {
  const MainTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: 600,
      height: 300,
      child: RichText(
        textAlign: TextAlign.start,
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Добро пожаловать.',
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: ' Миллионы фильмов, сериалов и людей. Исследуйте сейчас.',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchWithButtonWidget extends StatefulWidget {
  const SearchWithButtonWidget({super.key});

  @override
  State<SearchWithButtonWidget> createState() => _SearchWithButtonWidgetState();
}

class _SearchWithButtonWidgetState extends State<SearchWithButtonWidget> {
  final textController = TextEditingController();

  void _onTap() {
    textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(15),
      width: 600,
      height: 300,
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          labelText: 'Поиск...',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          suffixIcon: Container(
            padding: const EdgeInsets.fromLTRB(0, 2, 2, 2),
            width: 150,
            height: 50,
            child: ElevatedButton(
              onPressed: _onTap,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'Search',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
