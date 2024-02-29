import 'package:flutter/material.dart';

import '../../domain/models/film_model.dart';
import '../components/buttons/like_button.dart';
import '../components/buttons/primary_button.dart';
import '../components/image_network.dart';
import '../pages/details/pages/details_page.dart';

class FilmCard extends StatelessWidget {
  const FilmCard({
    super.key,
    required this.id,
    required this.title,
    required this.picture,
    required this.countries,
    required this.voteAverage,
    required this.releaseDate,
    required this.genres,
  });

  factory FilmCard.fromModel({
    required FilmModel model,
    Key? key,
  }) {
    return FilmCard(
      key: key,
      id: model.id,
      title: model.title,
      picture: model.picture,
      countries: model.countries,
      voteAverage: model.voteAverage,
      releaseDate: model.releaseDate,
      genres: model.genres,
    );
  }

  final int id;
  final String title;
  final String picture;
  final List<String> countries;
  final double voteAverage;
  final String releaseDate;
  final List<String> genres;

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
            child: _buildRatingChip(context),
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
              onPressed: () => _onTap(context),
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

  Widget _buildRatingChip(BuildContext context) {
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
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    Navigator.pushNamed(
      context,
      DetailsPage.path,
      arguments: DetailsArguments(
        id,
        title,
        picture,
        countries,
        voteAverage,
        releaseDate,
        genres,
      ),
    );
  }
}
