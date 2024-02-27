import 'package:flutter/material.dart';
import 'package:flutter_education_mad_brains/app/widgets/image_network.dart';

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
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        title: const Text('Details', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  arguments.title,
                  style: TextStyle(
                    fontSize:
                        Theme.of(context).textTheme.titleLarge?.fontSize ??
                            24.0,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ImageNetwork(pictureUrl: arguments.picture, fit: BoxFit.fill),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 4.0),
                child: Text(
                  arguments.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Режиссер: ${arguments.director}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Жанр: ${arguments.genre}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Дата релиза: ${arguments.releaseDate}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
