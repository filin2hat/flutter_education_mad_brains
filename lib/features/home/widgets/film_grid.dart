import 'package:flutter/cupertino.dart';

import '../../../app/data/mock/dummy_films_data.dart';
import '../../../app/widgets/film_card.dart';

class FilmGrid extends StatelessWidget {
  const FilmGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: FilmCard.fromModel(model: films[index % films.length]),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
      ),
    );
  }
}
