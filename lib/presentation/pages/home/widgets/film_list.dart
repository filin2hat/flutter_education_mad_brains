import 'package:flutter/cupertino.dart';

import '../../../../data/mock/dummy_films_data.dart';
import '../../../widgets/film_tile.dart';

class FilmList extends StatelessWidget {
  const FilmList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return FilmTile.fromModel(model: films[index % films.length]);
      },
    );
  }
}
