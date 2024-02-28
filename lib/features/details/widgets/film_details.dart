import 'package:flutter/material.dart';

import '../../../app/widgets/image_network.dart';
import '../pages/details_page.dart';

class FilmDetails extends StatelessWidget {
  const FilmDetails({
    super.key,
    required this.arguments,
  });

  final DetailsArguments arguments;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            )),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTitle(context),
              _buildImage(context),
              _buildDescription(context),
              _buildDirector(context),
              _buildGenre(context),
              _buildReleaseDate(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        arguments.title,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.titleLarge?.fontSize ?? 24.0,
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: ImageNetwork(
          pictureUrl: arguments.picture,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
        bottom: 4.0,
      ),
      child: Text(
        arguments.description,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 16.0,
        ),
      ),
    );
  }

  Widget _buildDirector(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        'Режиссер: ${arguments.director}',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 12.0,
        ),
      ),
    );
  }

  Widget _buildGenre(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        'Жанр: ${arguments.genre}',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 12.0,
        ),
      ),
    );
  }

  Widget _buildReleaseDate(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
        left: 16.0,
        right: 16.0,
        top: 4.0,
      ),
      child: Text(
        'Дата релиза: ${arguments.releaseDate}',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 12.0,
        ),
      ),
    );
  }
}
