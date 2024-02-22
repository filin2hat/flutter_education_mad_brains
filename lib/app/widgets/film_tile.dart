import 'package:flutter/material.dart';

import '../models/film_card_model.dart';

class FilmTile extends StatelessWidget {
  const FilmTile(
      {super.key,
      required this.id,
      required this.title,
      required this.picture,
      required this.voteAverage,
      required this.releaseDate,
      required this.description});

  factory FilmTile.fromModel({
    required FilmCardModel model,
    Key? key,
  }) {
    return FilmTile(
      id: model.id,
      title: model.title,
      picture: model.picture,
      voteAverage: model.voteAverage,
      releaseDate: model.releaseDate,
      description: model.description,
      key: key,
    );
  }

  final int id;
  final String title;
  final String picture;
  final double voteAverage;
  final String releaseDate;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Image.network(picture,
              loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return const CircularProgressIndicator();
          }),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.headlineSmall),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.star, color: Colors.yellow)),
                      Expanded(
                        child: Text(
                          voteAverage.toStringAsFixed(1),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16.0,
                              color: voteAverage < 4
                                  ? Colors.red
                                  : voteAverage >= 8
                                      ? Colors.green
                                      : Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                    child: Text(
                      'Год выхода: $releaseDate',
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    )),
                Text(
                  description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
