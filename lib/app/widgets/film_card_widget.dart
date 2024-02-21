import 'package:flutter/material.dart';

import '../domain/model/movie_model.dart';

class FilmCard extends StatelessWidget {
  const FilmCard({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.red,
      surfaceTintColor: Colors.redAccent,
      elevation: 3,
      color: Colors.black45,
      child: SizedBox(
        height: 200,
        child: Row(
          children: <Widget>[
            ImageSection(movie: movie),
            TextSection(movie: movie),
          ],
        ),
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                movie.title,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: Text(
                movie.description,
                style: const TextStyle(fontSize: 13, color: Colors.white70),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                'Year: ${movie.releaseDate.year} \nLang: ${movie.language}',
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          movie.picture,
        ),
        Text(
          movie.voteAverage.toString(),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.red,
            backgroundColor: Colors.black87,
          ),
        ),
      ],
    );
  }
}
