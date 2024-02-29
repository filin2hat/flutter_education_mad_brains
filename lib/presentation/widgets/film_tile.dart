import 'package:flutter/material.dart';

import '../../domain/models/film_model.dart';
import '../components/utils/image_network.dart';
import '../pages/details/pages/details_page.dart';

class FilmTile extends StatelessWidget {
  const FilmTile({
    super.key,
    required this.id,
    required this.title,
    required this.picture,
    required this.countries,
    required this.voteAverage,
    required this.releaseDate,
    required this.genres,
  });

  final int id;
  final String title;
  final String picture;
  final List<String> countries;
  final double voteAverage;
  final String releaseDate;
  final List<String> genres;

  factory FilmTile.fromModel({
    required FilmModel model,
    Key? key,
  }) {
    return FilmTile(
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: GestureDetector(
        onTap: () => _onTap(context),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.0,
            ),
          ),
          elevation: 6.0,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          color: Theme.of(context).colorScheme.primaryContainer,
          shadowColor: Theme.of(context).colorScheme.primary,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    ImageNetwork(
                      pictureUrl: picture,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.star, color: Colors.yellow),
                          ),
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
                                        : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          'Год выхода: $releaseDate',
                          style: Theme.of(context).textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          countries.join(', '),
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/details',
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
