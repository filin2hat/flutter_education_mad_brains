import 'package:flutter/material.dart';
import 'package:flutter_education_mad_brains/app/widgets/buttons/primary_button.dart';

import '../models/film_card_model.dart';
import 'image_network.dart';

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
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
            color: Theme.of(context).colorScheme.primary, width: 1.0),
      ),
      elevation: 6.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      color: Theme.of(context).colorScheme.primaryContainer,
      shadowColor: Theme.of(context).colorScheme.primary,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Stack(children: [
              ImageNetwork(
                pictureUrl: picture,
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 8,
                bottom: 8,
                right: 8,
                child: PrimaryButton(
                  title: "More",
                  onPressed: () {
                    // TODO: implement navigation to details page
                  },
                ),
              )
            ]),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(title, style: Theme.of(context).textTheme.headlineSmall),
                  Row(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Год выхода: $releaseDate',
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    description,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
