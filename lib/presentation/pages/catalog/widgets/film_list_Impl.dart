import 'package:flutter/cupertino.dart';

import '../../../../data/repository/repository.dart';
import '../../../widgets/film_tile.dart';
import 'film_base.dart';

class FilmListImpl extends StatelessWidget {
  const FilmListImpl({super.key});

  @override
  Widget build(BuildContext context) {
    return FilmBase(
      queryType: FilmQuery.queryTopPopularMovies,
      builder: (filmsList) {
        return ListView.builder(
          itemCount: filmsList.result.length,
          itemBuilder: (BuildContext context, int index) {
            return FilmTile.fromModel(model: filmsList.result[index]);
          },
        );
      },
    );
  }
}
