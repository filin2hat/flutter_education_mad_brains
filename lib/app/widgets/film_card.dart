import 'package:flutter/material.dart';
import 'package:flutter_education_mad_brains/app/widgets/image_network.dart';

import '../models/film_card_model.dart';

class FilmCard extends StatelessWidget {
  const FilmCard(
      {super.key,
      required this.id,
      required this.title,
      required this.picture,
      required this.voteAverage});

  factory FilmCard.fromModel({required FilmCardModel model, Key? key}) {
    return FilmCard(
      id: model.id,
      title: model.title,
      picture: model.picture,
      voteAverage: model.voteAverage,
      key: key,
    );
  }

  final int id;
  final String title;
  final String picture;
  final double voteAverage;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ImageNetwork(
                pictureUrl: picture,
              ))),
      Positioned(
        left: 4,
        top: 4,
        child: _RatingChip(voteAverage: voteAverage),
      )
    ]);
  }
}

class _RatingChip extends StatelessWidget {
  const _RatingChip({super.key, required this.voteAverage});

  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Chip(
        padding: const EdgeInsets.all(4),
        shape: const StadiumBorder(),
        elevation: 2,
        shadowColor: Colors.black,
        labelPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
        avatar: const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        label: Text(voteAverage.toStringAsFixed(1),
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor);
  }
}
