import 'package:flutter/material.dart';
import 'package:flutter_education_mad_brains/app/widgets/buttons/primary_button.dart';
import 'package:flutter_education_mad_brains/app/widgets/image_network.dart';

import '../models/film_card_model.dart';
import 'buttons/like_button.dart';

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
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ImageNetwork(
              pictureUrl: picture,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          right: 4,
          top: 4,
          child: Padding(
            padding: const EdgeInsets.only(right: 4),
            child: _RatingChip(voteAverage: voteAverage),
          ),
        ),
        Positioned(
          left: 8,
          bottom: 8,
          right: 8,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: PrimaryButton(
              title: "More",
              onPressed: () {
                // TODO: implement navigation to details page
              },
            ),
          ),
        ),
        const Positioned(
          left: 2,
          top: 2,
          child: LikeButton(),
        )
      ],
    );
  }
}

class _RatingChip extends StatelessWidget {
  const _RatingChip({super.key, required this.voteAverage});

  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary,
              blurRadius: 3,
              spreadRadius: 2,
            ),
          ],
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.onBackground,
            ],
          ),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    voteAverage.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
