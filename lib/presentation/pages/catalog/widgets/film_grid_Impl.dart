import 'package:flutter/cupertino.dart';

import '../../../../data/repository/repository.dart';
import '../../../widgets/film_card.dart';
import 'film_base.dart';

class FilmGridImpl extends StatelessWidget {
  const FilmGridImpl({super.key});

  @override
  Widget build(BuildContext context) {
    return FilmBase(
      queryType: FilmQuery.queryTop250Movies,
      builder: (filmsList) {
        return GridView.builder(
          itemCount: filmsList.result.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: FilmCard.fromModel(model: filmsList.result[index]),
            );
          },
        );
      },
    );
  }
}
