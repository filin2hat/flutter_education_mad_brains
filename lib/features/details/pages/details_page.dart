import 'package:flutter/material.dart';

import '../widgets/film_details.dart';

class DetailsArguments {
  const DetailsArguments(this.id, this.title, this.picture, this.voteAverage,
      this.releaseDate, this.description, this.director, this.genre);
  final int id;
  final String title;
  final String picture;
  final double voteAverage;
  final String releaseDate;
  final String description;
  final String director;
  final String genre;
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.arguments,
  });

  final DetailsArguments arguments;
  static const path = '/details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      appBar: AppBar(
        title: const Text('Details', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: FilmDetails(arguments: arguments),
    );
  }
}
