
import 'package:flutter/cupertino.dart';

import '../../domain/model/movie.dart';
import 'film_card_widget.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
    required List<Movie> movies,
  }) : _movies = movies;

  final List<Movie> _movies;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (context, index) {
          final movie = _movies[index];
          return FilmCard(movie: movie);
        },
      ),
    );
  }
}